typealias Oid UInt32
typealias pg_int64 Clong

typealias ConnStatusType UInt32
typealias PostgresPollingStatusType UInt32
typealias ExecStatusType UInt32
typealias PGTransactionStatusType UInt32
typealias PGVerbosity UInt32
typealias PGPing UInt32
typealias PGconn Void
typealias PGresult Void
typealias PGcancel Void
typealias PQnoticeReceiver Ptr{Void}
typealias PQnoticeProcessor Ptr{Void}
typealias pqbool UInt8
typealias pgthreadlock_t Ptr{Void}

# Skipping MacroDefinition: PQsetdb ( M_PGHOST , M_PGPORT , M_PGOPT , M_PGTTY , M_DBNAME ) PQsetdbLogin ( M_PGHOST , M_PGPORT , M_PGOPT , M_PGTTY , M_DBNAME , NULL , NULL )
# Skipping MacroDefinition: PQfreeNotify ( ptr ) PQfreemem ( ptr )

type pg_conn
end

type pg_result
end

type pg_cancel
end

type pgNotify
    relname::Cstring
    be_pid::Cint
    extra::Cstring
    next::Ptr{pgNotify}
end

type PGnotify
    relname::Cstring
    be_pid::Cint
    extra::Cstring
    next::Ptr{pgNotify}
end

type _PQprintOpt
    header::pqbool
    align::pqbool
    standard::pqbool
    html3::pqbool
    expanded::pqbool
    pager::pqbool
    fieldSep::Cstring
    tableOpt::Cstring
    caption::Cstring
    fieldName::Ptr{Cstring}
end

type PQprintOpt
    header::pqbool
    align::pqbool
    standard::pqbool
    html3::pqbool
    expanded::pqbool
    pager::pqbool
    fieldSep::Cstring
    tableOpt::Cstring
    caption::Cstring
    fieldName::Ptr{Cstring}
end

type _PQconninfoOption
    keyword::Cstring
    envvar::Cstring
    compiled::Cstring
    val::Cstring
    label::Cstring
    dispchar::Cstring
    dispsize::Cint
end

type PQconninfoOption
    keyword::Cstring
    envvar::Cstring
    compiled::Cstring
    val::Cstring
    label::Cstring
    dispchar::Cstring
    dispsize::Cint
end

type PQArgBlock
    len::Cint
    isint::Cint
    u::Void
end

type pgresAttDesc
    name::Cstring
    tableid::Oid
    columnid::Cint
    format::Cint
    typid::Oid
    typlen::Cint
    atttypmod::Cint
end

type PGresAttDesc
    name::Cstring
    tableid::Oid
    columnid::Cint
    format::Cint
    typid::Oid
    typlen::Cint
    atttypmod::Cint
end
