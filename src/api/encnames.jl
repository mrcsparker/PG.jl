function pg_char_to_encoding(name)
    ccall((:pg_char_to_encoding, libpq),
          Cint,
          (Cstring, ),
          name)
end

function pg_encoding_to_char(encoding::Cint)
    ccall((:pg_encoding_to_char, libpq),
          Cstring,
          (Cint, ),
          encoding)
end

function pg_valid_server_encoding_id(encoding::Cint)
    ccall((:pg_valid_server_encoding_id, libpq),
          Cint,
          (Cint, ),
          encoding)
end
