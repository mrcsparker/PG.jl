function PQexec(conn, query)
    ccall((:PQexec, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, Cstring),
          conn,
          query)
end

function PQexecParams(conn, command, nParams::Cint, paramTypes, paramValues, paramLengths, paramFormats, resultFormat::Cint)
    ccall((:PQexecParams, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, Cstring, Cint, Ptr{Oid}, Ptr{Cstring}, Ptr{Cint}, Ptr{Cint}, Cint),
          conn,
          command,
          nParams,
          paramTypes,
          paramValues,
          paramLengths,
          paramFormats,
          resultFormat)
end

function PQprepare(conn, stmtName, query, nParams::Cint, paramTypes)
    ccall((:PQprepare, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, Cstring, Cstring, Cint, Ptr{Oid}),
          conn,
          stmtName,
          query,
          nParams,
          paramTypes)
end

function PQexecPrepared(conn, stmtName, nParams::Cint, paramValues, paramLengths, paramFormats, resultFormat::Cint)
    ccall((:PQexecPrepared, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, Cstring, Cint, Ptr{Cstring}, Ptr{Cint}, Ptr{Cint}, Cint),
          conn,
          stmtName,
          nParams,
          paramValues,
          paramLengths,
          paramFormats,
          resultFormat)
end

function PQsendQuery(conn, query)
    ccall((:PQsendQuery, libpq),
          Cint,
          (Ptr{PGconn}, Cstring),
          conn,
          query)
end

function PQsendQueryParams(conn, command, nParams::Cint, paramTypes, paramValues, paramLengths, paramFormats, resultFormat::Cint)
    ccall((:PQsendQueryParams, libpq),
          Cint,
          (Ptr{PGconn}, Cstring, Cint, Ptr{Oid}, Ptr{Cstring}, Ptr{Cint}, Ptr{Cint}, Cint),
          conn,
          command,
          nParams,
          paramTypes,
          paramValues,
          paramLengths,
          paramFormats,
          resultFormat)
end

function PQsendPrepare(conn, stmtName, query, nParams::Cint, paramTypes)
    ccall((:PQsendPrepare, libpq),
          Cint,
          (Ptr{PGconn}, Cstring, Cstring, Cint, Ptr{Oid}),
          conn,
          stmtName,
          query,
          nParams,
          paramTypes)
end

function PQsendQueryPrepared(conn, stmtName, nParams::Cint, paramValues, paramLengths, paramFormats, resultFormat::Cint)
    ccall((:PQsendQueryPrepared, libpq),
          Cint,
          (Ptr{PGconn}, Cstring, Cint, Ptr{Cstring}, Ptr{Cint}, Ptr{Cint}, Cint),
          conn,
          stmtName,
          nParams,
          paramValues,
          paramLengths,
          paramFormats,
          resultFormat)
end

function PQsetSingleRowMode(conn)
    ccall((:PQsetSingleRowMode, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQgetResult(conn)
    ccall((:PQgetResult, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, ),
          conn)
end

function PQisBusy(conn)
    ccall((:PQisBusy, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQconsumeInput(conn)
    ccall((:PQconsumeInput,libpq),Cint,(Ptr{PGconn},),conn)
end

function PQnotifies(conn)
    ccall((:PQnotifies,libpq),Ptr{PGnotify},(Ptr{PGconn},),conn)
end

function PQputCopyData(conn, buffer, nbytes::Cint)
    ccall((:PQputCopyData, libpq),
          Cint,
          (Ptr{PGconn}, Cstring, Cint),
          conn,
          buffer,
          nbytes)
end

function PQputCopyEnd(conn, errormsg)
    ccall((:PQputCopyEnd, libpq),
          Cint,
          (Ptr{PGconn}, Cstring),
          conn,
          errormsg)
end

function PQgetCopyData(conn, buffer, async::Cint)
    ccall((:PQgetCopyData, libpq),
          Cint,
          (Ptr{PGconn}, Ptr{Cstring}, Cint),
          conn,
          buffer,
          async)
end

function PQgetline(conn, string, length::Cint)
    ccall((:PQgetline, libpq),
          Cint,
          (Ptr{PGconn}, Cstring, Cint),
          conn,
          string,
          length)
end

function PQputline(conn, string)
    ccall((:PQputline, libpq),
          Cint,
          (Ptr{PGconn}, Cstring),
          conn,
          string)
end

function PQgetlineAsync(conn, buffer, bufsize::Cint)
    ccall((:PQgetlineAsync, libpq),
          Cint,
          (Ptr{PGconn}, Cstring, Cint),
          conn,
          buffer,
          bufsize)
end

function PQputnbytes(conn, buffer, nbytes::Cint)
    ccall((:PQputnbytes, libpq),
          Cint,
          (Ptr{PGconn}, Cstring, Cint),
          conn,
          buffer,
          nbytes)
end

function PQendcopy(conn)
    ccall((:PQendcopy, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQsetnonblocking(conn, arg::Cint)
    ccall((:PQsetnonblocking, libpq),
          Cint,
          (Ptr{PGconn}, Cint),
          conn,
          arg)
end

function PQisnonblocking(conn)
    ccall((:PQisnonblocking, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQisthreadsafe()
    ccall((:PQisthreadsafe, libpq),
          Cint,
          ())
end

function PQping(conninfo)
    ccall((:PQping, libpq),
          PGPing,
          (Cstring, ),
          conninfo)
end

function PQpingParams(keywords, values, expand_dbname::Cint)
    ccall((:PQpingParams, libpq),
          PGPing,
          (Ptr{Cstring}, Ptr{Cstring}, Cint),
          keywords,
          values,
          expand_dbname)
end

function PQflush(conn)
    ccall((:PQflush, libpq),
          Cint,
          (Ptr{PGconn}, ),
          conn)
end

function PQfn(conn, fnid::Cint, result_buf, result_len, result_is_int::Cint, args, nargs::Cint)
    ccall((:PQfn, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, Cint, Ptr{Cint}, Ptr{Cint}, Cint, Ptr{PQArgBlock}, Cint),
          conn,
          fnid,
          result_buf,
          result_len,
          result_is_int,
          args,
          nargs)
end

function PQresultStatus(res)
    ccall((:PQresultStatus, libpq),
          ExecStatusType,
          (Ptr{PGresult}, ),
          res)
end

function PQresStatus(status::ExecStatusType)
    ccall((:PQresStatus, libpq),
          Cstring,
          (ExecStatusType, ),
          status)
end

function PQresultErrorMessage(res)
    ccall((:PQresultErrorMessage, libpq),
          Cstring,
          (Ptr{PGresult}, ),
          res)
end

function PQresultErrorField(res, fieldcode::Cint)
    ccall((:PQresultErrorField, libpq),
          Cstring,
          (Ptr{PGresult}, Cint),
          res,
          fieldcode)
end

function PQntuples(res)
    ccall((:PQntuples, libpq),
          Cint,
          (Ptr{PGresult}, ),
          res)
end

function PQnfields(res)
    ccall((:PQnfields, libpq),
          Cint,
          (Ptr{PGresult}, ),
          res)
end

function PQbinaryTuples(res)
    ccall((:PQbinaryTuples, libpq),
          Cint,
          (Ptr{PGresult}, ),
          res)
end

function PQfname(res, field_num::Cint)
    ccall((:PQfname, libpq),
          Cstring,
          (Ptr{PGresult}, Cint),
          res,
          field_num)
end

function PQfnumber(res, field_name)
    ccall((:PQfnumber, libpq),
          Cint,
          (Ptr{PGresult}, Cstring),
          res,
          field_name)
end

function PQftable(res, field_num::Cint)
    ccall((:PQftable, libpq),
          Oid,
          (Ptr{PGresult}, Cint),
          res,
          field_num)
end

function PQftablecol(res, field_num::Cint)
    ccall((:PQftablecol, libpq),
          Cint,
          (Ptr{PGresult}, Cint),
          res,
          field_num)
end

function PQfformat(res, field_num::Cint)
    ccall((:PQfformat, libpq),
          Cint,
          (Ptr{PGresult}, Cint),
          res,
          field_num)
end

function PQftype(res, field_num::Cint)
    ccall((:PQftype, libpq),
          Oid,
          (Ptr{PGresult}, Cint),
          res,
          field_num)
end

function PQfsize(res, field_num::Cint)
    ccall((:PQfsize, libpq),
          Cint,
          (Ptr{PGresult}, Cint),
          res,
          field_num)
end

function PQfmod(res, field_num::Cint)
    ccall((:PQfmod, libpq),
          Cint,
          (Ptr{PGresult}, Cint),
          res,
          field_num)
end

function PQcmdStatus(res)
    ccall((:PQcmdStatus, libpq),
          Cstring,
          (Ptr{PGresult}, ),
          res)
end

function PQoidStatus(res)
    ccall((:PQoidStatus, libpq),
          Cstring,
          (Ptr{PGresult}, ),
          res)
end

function PQoidValue(res)
    ccall((:PQoidValue, libpq),
          Oid,
          (Ptr{PGresult}, ),
          res)
end

function PQcmdTuples(res)
    ccall((:PQcmdTuples, libpq),
          Cstring,
          (Ptr{PGresult}, ),
          res)
end

function PQgetvalue(res, tup_num::Cint, field_num::Cint)
    ccall((:PQgetvalue, libpq),
          Cstring,
          (Ptr{PGresult}, Cint, Cint),
          res,
          tup_num,
          field_num)
end

function PQgetlength(res,tup_num::Cint,field_num::Cint)
    ccall((:PQgetlength, libpq),
          Cint,
          (Ptr{PGresult}, Cint, Cint),
          res,
          tup_num,
          field_num)
end

function PQgetisnull(res, tup_num::Cint, field_num::Cint)
    ccall((:PQgetisnull, libpq),
          Cint,
          (Ptr{PGresult}, Cint, Cint),
          res,
          tup_num,
          field_num)
end

function PQnparams(res)
    ccall((:PQnparams, libpq),
          Cint,
          (Ptr{PGresult}, ),
          res)
end

function PQparamtype(res, param_num::Cint)
    ccall((:PQparamtype, libpq),
          Oid,
          (Ptr{PGresult}, Cint),
          res,
          param_num)
end

function PQdescribePrepared(conn, stmt)
    ccall((:PQdescribePrepared, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, Cstring),
          conn,
          stmt)
end

function PQdescribePortal(conn, portal)
    ccall((:PQdescribePortal, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, Cstring),
          conn,
          portal)
end

function PQsendDescribePrepared(conn, stmt)
    ccall((:PQsendDescribePrepared, libpq),
          Cint,
          (Ptr{PGconn}, Cstring),
          conn,
          stmt)
end

function PQsendDescribePortal(conn, portal)
    ccall((:PQsendDescribePortal, libpq),
          Cint,
          (Ptr{PGconn}, Cstring),
          conn,
          portal)
end

function PQclear(res)
    ccall((:PQclear, libpq),
          Void,
          (Ptr{PGresult}, ),
          res)
end

function PQfreemem(ptr)
    ccall((:PQfreemem, libpq),
          Void,
          (Ptr{Void}, ),
          ptr)
end

function PQmakeEmptyPGresult(conn, status::ExecStatusType)
    ccall((:PQmakeEmptyPGresult, libpq),
          Ptr{PGresult},
          (Ptr{PGconn}, ExecStatusType),
          conn,
          status)
end

function PQcopyResult(src, flags::Cint)
    ccall((:PQcopyResult, libpq),
          Ptr{PGresult},
          (Ptr{PGresult}, Cint),
          src,
          flags)
end

function PQsetResultAttrs(res, numAttributes::Cint, attDescs)
    ccall((:PQsetResultAttrs, libpq),
          Cint,
          (Ptr{PGresult}, Cint, Ptr{PGresAttDesc}),
          res,
          numAttributes,
          attDescs)
end

function PQresultAlloc(res, nBytes::Csize_t)
    ccall((:PQresultAlloc, libpq),
          Ptr{Void},
          (Ptr{PGresult}, Csize_t),
          res,
          nBytes)
end

function PQsetvalue(res, tup_num::Cint, field_num::Cint, value, len::Cint)
    ccall((:PQsetvalue, libpq),
          Cint,
          (Ptr{PGresult}, Cint, Cint, Cstring, Cint),
          res,
          tup_num,
          field_num,
          value,
          len)
end

function PQescapeStringConn(conn, to, from, length::Csize_t, error)
    ccall((:PQescapeStringConn, libpq),
          Csize_t,
          (Ptr{PGconn}, Cstring, Cstring, Csize_t, Ptr{Cint}),
          conn,
          to,
          from,
          length,
          error)
end

function PQescapeLiteral(conn, str, len::Csize_t)
    ccall((:PQescapeLiteral, libpq),
          Cstring,
          (Ptr{PGconn}, Cstring, Csize_t),
          conn,
          str,
          len)
end

function PQescapeIdentifier(conn, str, len::Csize_t)
    ccall((:PQescapeIdentifier, libpq),
          Cstring,
          (Ptr{PGconn}, Cstring, Csize_t),
          conn,
          str,
          len)
end

function PQescapeByteaConn(conn, from, from_length::Csize_t, to_length)
    ccall((:PQescapeByteaConn, libpq),
          Ptr{Cuchar},
          (Ptr{PGconn}, Ptr{Cuchar}, Csize_t, Ptr{Csize_t}),
          conn,
          from,
          from_length,
          to_length)
end

function PQunescapeBytea(strtext, retbuflen)
    ccall((:PQunescapeBytea, libpq),
          Ptr{Cuchar},
          (Ptr{Cuchar}, Ptr{Csize_t}),
          strtext,
          retbuflen)
end

function PQescapeString(to, from, length::Csize_t)
    ccall((:PQescapeString, libpq),
          Csize_t,
          (Cstring, Cstring, Csize_t),
          to,
          from,
          length)
end

function PQescapeBytea(from, from_length::Csize_t, to_length)
    ccall((:PQescapeBytea, libpq),
          Ptr{Cuchar},
          (Ptr{Cuchar}, Csize_t, Ptr{Csize_t}),
          from,
          from_length,
          to_length)
end
