# Large-object access routines

function lo_open(conn, lobjId::Oid, mode::Cint)
    ccall((:lo_open, libpq),
          Cint,
          (Ptr{PGconn}, Oid, Cint),
          conn,
          lobjId,
          mode)
end

function lo_close(conn,fd::Cint)
    ccall((:lo_close, libpq),
          Cint,
          (Ptr{PGconn}, Cint),
          conn,
          fd)
end

function lo_read(conn,fd::Cint, buf, len::Csize_t)
    ccall((:lo_read,libpq),
          Cint,
          (Ptr{PGconn}, Cint, Cstring, Csize_t),
          conn,
          fd,
          buf,
          len)
end

function lo_write(conn,fd::Cint, buf, len::Csize_t)
    ccall((:lo_write,libpq),
          Cint,
          (Ptr{PGconn}, Cint, Cstring, Csize_t),
          conn,
          fd,
          buf,
          len)
end

function lo_lseek(conn, fd::Cint, offset::Cint, whence::Cint)
    ccall((:lo_lseek, libpq),
          Cint,
          (Ptr{PGconn}, Cint, Cint, Cint),
          conn,
          fd,
          offset,
          whence)
end

function lo_lseek64(conn,fd::Cint,offset::pg_int64,whence::Cint)
    ccall((:lo_lseek64, libpq),
          pg_int64,
          (Ptr{PGconn}, Cint, pg_int64, Cint),
          conn,
          fd,
          offset,
          whence)
end

function lo_creat(conn,mode::Cint)
    ccall((:lo_creat, libpq),
          Oid,
          (Ptr{PGconn}, Cint),
          conn,
          mode)
end

function lo_create(conn,lobjId::Oid)
    ccall((:lo_create, libpq),
          Oid,
          (Ptr{PGconn}, Oid),
          conn,
          lobjId)
end

function lo_tell(conn,fd::Cint)
    ccall((:lo_tell, libpq),
          Cint,
          (Ptr{PGconn}, Cint),
          conn,
          fd)
end

function lo_tell64(conn,fd::Cint)
    ccall((:lo_tell64, libpq),
          pg_int64,
          (Ptr{PGconn}, Cint),
          conn,
          fd)
end

function lo_truncate(conn,fd::Cint,len::Csize_t)
    ccall((:lo_truncate, libpq),
          Cint,
          (Ptr{PGconn}, Cint, Csize_t),
          conn,
          fd,
          len)
end

function lo_truncate64(conn,fd::Cint,len::pg_int64)
    ccall((:lo_truncate64, libpq),
          Cint,
          (Ptr{PGconn}, Cint, pg_int64),
          conn,
          fd,
          len)
end

function lo_unlink(conn, lobjId::Oid)
    ccall((:lo_unlink, libpq),
          Cint,
          (Ptr{PGconn}, Oid),
          conn,
          lobjId)
end

function lo_import(conn,filename)
    ccall((:lo_import, libpq),
          Oid,
          (Ptr{PGconn},
          Cstring),
          conn,
          filename)
end

function lo_import_with_oid(conn,filename,lobjId::Oid)
    ccall((:lo_import_with_oid, libpq),
          Oid,
          (Ptr{PGconn}, Cstring, Oid),
          conn,
          filename,
          lobjId)
end

function lo_export(conn, lobjId::Oid, filename)
    ccall((:lo_export, libpq),
          Cint,
          (Ptr{PGconn}, Oid, Cstring),
          conn,
          lobjId,
          filename)
end
