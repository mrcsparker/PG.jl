function PQencryptPassword(passwd, user)
    ccall((:PQencryptPassword, libpq),
          Cstring,
          (Cstring, Cstring),
          passwd,
          user)
end
