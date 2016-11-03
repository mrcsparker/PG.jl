"""
fout: output stream
ps: option structure
"""
function PQprint(fout, res, ps)
    ccall((:PQprint, libpq),
          Void,
          (Ptr{FILE}, Ptr{PGresult}, Ptr{PQprintOpt}),
          fout,
          res,
          ps)
end

"""
really old printing routine
"""
function PQdisplayTuples(res, fp, fillAlign::Cint, fieldSep, printHeader::Cint, quiet::Cint)
    ccall((:PQdisplayTuples, libpq),
          Void,
          (Ptr{PGresult}, Ptr{FILE}, Cint, Cstring, Cint, Cint),
          res,
          fp,
          fillAlign,
          fieldSep,
          printHeader,
          quiet)
end


"""
really old printing routine
"""
function PQprintTuples(res, fout, printAttName::Cint, terseOutput::Cint, width::Cint)
    ccall((:PQprintTuples, libpq),
          Void,
          (Ptr{PGresult}, Ptr{FILE}, Cint, Cint, Cint),
          res,
          fout,
          printAttName,
          terseOutput,
          width)
end
