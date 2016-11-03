# make a new client connection to the backend

## Asynchronous (non-blocking)

function PQconnectStart(conninfo)
    ccall((:PQconnectStart, libpq),
          Ptr{PGconn},
          (Cstring, ),
          conninfo)
end

function PQconnectStartParams(keywords, values, expand_dbname::Cint)
    ccall((:PQconnectStartParams, libpq),
          Ptr{PGconn},
          (Ptr{Cstring}, Ptr{Cstring}, Cint),
          keywords,
          values,
          expand_dbname)
end

function PQconnectPoll(conn)
    ccall((:PQconnectPoll, libpq),
          PostgresPollingStatusType,
          (Ptr{PGconn}, ),
          conn)
end

## Synchronous (blocking)

function PQconnectdb(conninfo)
    ccall((:PQconnectdb, libpq),
          Ptr{PGconn},
          (Cstring, ),
          conninfo)
end

function PQconnectdbParams(keywords, values, expand_dbname::Cint)
    ccall((:PQconnectdbParams, libpq),
          Ptr{PGconn},
          (Ptr{Cstring}, Ptr{Cstring}, Cint),
          keywords,
          values,
          expand_dbname)
end

function PQsetdbLogin(pghost, pgport, pgoptions, pgtty, dbName, login, pwd)
    ccall((:PQsetdbLogin, libpq),
          Ptr{PGconn},
          (Cstring, Cstring, Cstring, Cstring, Cstring, Cstring, Cstring),
          pghost,
          pgport,
          pgoptions,
          pgtty,
          dbName,
          login,
          pwd)
end

# TODO: PQsetdb

"close the current connection and free the PGconn data structure"
function PQfinish(conn)
    ccall((:PQfinish, libpq),
          Void,
          (Ptr{PGconn}, ),
          conn)
end

"get info about connection options known to PQconnectdb"
function PQconndefaults()
    ccall((:PQconndefaults, libpq),
          Ptr{PQconninfoOption},
          ())
end

"parse connection options in same way as PQconnectdb"
function PQconninfoParse(conninfo, errmsg)
    ccall((:PQconninfoParse, libpq),
          Ptr{PQconninfoOption},
          (Cstring, Ptr{Cstring}),
          conninfo,
          errmsg)
end

"return the connection options used by a live connection"
function PQconninfo(conn)
    ccall((:PQconninfo, libpq),
          Ptr{PQconninfoOption},
          (Ptr{PGconn}, ),
          conn)
end

"free the data structure returned by PQconndefaults() or PQconninfoParse()"
function PQconninfoFree(connOptions)
    ccall((:PQconninfoFree, libpq),
          Void,
          (Ptr{PQconninfoOption}, ),
          connOptions)
end

"""
close the current connection and restablish a new one with the same
parameters

Asynchronous (non-blocking)
"""
function PQresetStart(conn)
    ccall((:PQresetStart, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

"""
close the current connection and restablish a new one with the same
parameters

Asynchronous (non-blocking)
"""
function PQresetPoll(conn)
    ccall((:PQresetPoll, libpq),
          PostgresPollingStatusType,
          (Ptr{PGconn}, ),
          conn)
end

"""
close the current connection and restablish a new one with the same
parameters

Synchronous (blocking)
"""
function PQreset(conn)
    ccall((:PQreset, libpq),
          Void,
          (Ptr{PGconn}, ),
          conn)
end

"request a cancel structure"
function PQgetCancel(conn)
    ccall((:PQgetCancel, libpq),
          Ptr{PGcancel},
          (Ptr{PGconn}, ),
          conn)
end

"free a cancel structure"
function PQfreeCancel(cancel)
    ccall((:PQfreeCancel, libpq),
          Void,
          (Ptr{PGcancel}, ),
          cancel)
end

"issue a cancel request"
function PQcancel(cancel, errbuf, errbufsize::Cint)
    ccall((:PQcancel, libpq),
          Cint,
          (Ptr{PGcancel}, Cstring, Cint),
          cancel,
          errbuf,
          errbufsize)
end

"backwards compatible version of PQcancel; not thread-safe"
function PQrequestCancel(conn)
    ccall((:PQrequestCancel, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

## Accessor functions for PGconn objects

function PQdb(conn)
    ccall((:PQdb, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQuser(conn)
    ccall((:PQuser, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQpass(conn)
    ccall((:PQpass, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQhost(conn)
    ccall((:PQhost, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQport(conn)
    ccall((:PQport, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQtty(conn)
    ccall((:PQtty, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQoptions(conn)
    ccall((:PQoptions, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQstatus(conn)
    ccall((:PQstatus, libpq),
          ConnStatusType,
          (Ptr{PGconn}, ),
          conn)
end

function PQtransactionStatus(conn)
    ccall((:PQtransactionStatus, libpq),
          PGTransactionStatusType,
          (Ptr{PGconn}, ),
          conn)
end

function PQparameterStatus(conn, paramName)
    ccall((:PQparameterStatus, libpq),
          Cstring,
          (Ptr{PGconn}, Cstring),
          conn,
          paramName)
end

function PQprotocolVersion(conn)
    ccall((:PQprotocolVersion, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQserverVersion(conn)
    ccall((:PQserverVersion, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQerrorMessage(conn)
    ccall((:PQerrorMessage, libpq),
          Cstring,
          (Ptr{PGconn}, ),
          conn)
end

function PQsocket(conn)
    ccall((:PQsocket, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQbackendPID(conn)
    ccall((:PQbackendPID, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQconnectionNeedsPassword(conn)
    ccall((:PQconnectionNeedsPassword, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQconnectionUsedPassword(conn)
    ccall((:PQconnectionUsedPassword, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQclientEncoding(conn)
    ccall((:PQclientEncoding, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQsetClientEncoding(conn, encoding)
    ccall((:PQsetClientEncoding, libpq),
          Cint,
          (Ptr{PGconn}, Cstring),
          conn,
          encoding)
end

function PQsslInUse(conn)
    ccall((:PQsslInUse, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQsslStruct(conn, struct_name)
    ccall((:PQsslStruct, libpq),
          Ptr{Void},
          (Ptr{PGconn}, Cstring),
          conn,
          struct_name)
end

function PQsslAttribute(conn, attribute_name)
    ccall((:PQsslAttribute, libpq),
          Cstring,
          (Ptr{PGconn}, Cstring),
          conn,
          attribute_name)
end

function PQsslAttributeNames(conn)
    ccall((:PQsslAttributeNames, libpq),
          Ptr{Cstring}, (Ptr{PGconn}, ),
          conn)
end

function PQgetssl(conn)
    ccall((:PQgetssl, libpq),
          Ptr{Void}, (Ptr{PGconn}, ),
          conn)
end

function PQinitSSL(do_init::Cint)
    ccall((:PQinitSSL, libpq),
          Void,
          (Cint, ),
          do_init)
end

function PQinitOpenSSL(do_ssl::Cint, do_crypto::Cint)
    ccall((:PQinitOpenSSL, libpq),
          Void,
          (Cint, Cint),
          do_ssl,
          do_crypto)
end

function PQsetErrorVerbosity(conn, verbosity::PGVerbosity)
    ccall((:PQsetErrorVerbosity, libpq),
          PGVerbosity,
          (Ptr{PGconn}, PGVerbosity),
          conn,
          verbosity)
end

function PQtrace(conn, debug_port)
    ccall((:PQtrace, libpq),
          Void,
          (Ptr{PGconn}, Ptr{FILE}),
          conn,
          debug_port)
end

function PQuntrace(conn)
    ccall((:PQuntrace, libpq),
          Void,
          (Ptr{PGconn}, ),
          conn)
end

function PQsetNoticeReceiver(conn,proc::PQnoticeReceiver, arg)
    ccall((:PQsetNoticeReceiver, libpq),
          PQnoticeReceiver,
          (Ptr{PGconn}, PQnoticeReceiver, Ptr{Void}),
          conn,
          proc,
          arg)
end

function PQsetNoticeProcessor(conn, proc::PQnoticeProcessor, arg)
    ccall((:PQsetNoticeProcessor, libpq),
          PQnoticeProcessor,
          (Ptr{PGconn}, PQnoticeProcessor, Ptr{Void}),
          conn,
          proc,
          arg)
end

function PQregisterThreadLock(newhandler::pgthreadlock_t)
    ccall((:PQregisterThreadLock, libpq),
          pgthreadlock_t,
          (pgthreadlock_t, ),
          newhandler)
end
