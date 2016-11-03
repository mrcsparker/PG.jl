"Get the version of the libpq library in use"
function PQlibVersion()
    ccall((:PQlibVersion, libpq),
          Cint,
          ())
end

"Determine length of multibyte encoded char at *s"
function PQmblen(s,encoding::Cint)
    ccall((:PQmblen, libpq),
          Cint,
          (Cstring, Cint),
          s,
          encoding)
end

"Determine display length of multibyte encoded char at *s"
function PQdsplen(s,encoding::Cint)
    ccall((:PQdsplen, libpq),
          Cint,
          (Cstring, Cint),
          s,
          encoding)
end

"Get encoding id from environment variable PGCLIENTENCODING"
function PQenv2encoding()
    ccall((:PQenv2encoding, libpq),
          Cint,
          ())
end
