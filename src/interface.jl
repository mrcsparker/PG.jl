type PGException <: Exception
    msg::AbstractString
end

type DB
    handle::Ptr{Void}

    function DB(;username::String = "", password::String = "", database::String = "", host::String = "localhost", port::String = "5432")
        handle = PQsetdbLogin(host, port, C_NULL, C_NULL, database, username, password)
        if PQstatus(handle) == CONNECTION_BAD
            err = unsafe_string(PQerrorMessage(handle))
            PQfinish(handle)
            error(err)
        end
        db = new(handle)
        finalizer(db, _close)
        db
    end
end

function _close(db::DB)
    PQfinish(db.handle)
    db.handle = C_NULL
end

function info(db::DB)
    Dict(
        :protocol_version => PQprotocolVersion(db.handle),
        :server_version => PQserverVersion(db.handle),
        :lib_version => PQlibVersion(),
        :database => unsafe_string(PQdb(db.handle)),
        :username => unsafe_string(PQuser(db.handle)),
        :password => unsafe_string(PQpass(db.handle)),
        :host => unsafe_string(PQhost(db.handle)),
        :port => unsafe_string(PQport(db.handle)),
        :tty => unsafe_string(PQtty(db.handle))
    )
end

type Stmt
    db::DB
    name::String
    handle::Ptr{Void}

    function Stmt(db::DB, sql::String)
        handle = PQprepare(db.handle, sql, sql, Int32(0), C_NULL)
        if PQresultStatus(handle) != PGRES_COMMAND_OK
            err = unsafe_string(PQerrorMessage(db.handle))
            error(err)
        end
        stmt = new(db, sql, handle)
        finalizer(stmt, _close)
        stmt
    end
end

function _close(stmt::Stmt)
    PQclear(stmt.handle)
    stmt.handle = C_NULL
end

function execute! end

function execute!(stmt::Stmt)
    res = PQexecPrepared(stmt.db.handle, stmt.name, Int32(0), C_NULL, C_NULL, C_NULL, Int32(0))
    if PQresultStatus(res) != PGRES_TUPLES_OK
        err = unsafe_string(PQerrorMessage(stmt.db.handle))
        PQclear(res)
        error(err)
    end
    res
end

function execute!(db::DB, sql::String)
    stmt = Stmt(db, sql)
    return execute!(stmt)
end
