using Test

using CUDA
using BaseAdd
using BenchmarkTools

@testset "BaseAdd.jl" begin
    N = 2^20

    x = fill(1.0f0, N)
    y = fill(2.0f0, N)

    @btime add!($y, $x)
    @btime add_parallel!($y, $x)
    @btime add!($(CuArray(y)), $(CuArray(x)))
end
