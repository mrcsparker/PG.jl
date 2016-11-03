#VERSION >= v"0.4" && __precompile__()

module PG

if isfile(joinpath(dirname(@__FILE__), "..", "deps", "deps.jl"))
    include("../deps/deps.jl")
else
    error("PG not properly installed. Please run Pkg.build(\"PG\")")
end

include("consts.jl")
include("types.jl")
include("api.jl")
include("interface.jl")

end
