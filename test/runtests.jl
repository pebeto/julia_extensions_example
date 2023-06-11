using Test

using CUDA
using BaseAdd
using BenchmarkTools

@testset "BaseAdd.jl" begin
    N = 2^20

    x = fill(1.0f0, N)
    y = fill(2.0f0, N)
    
    x_cu = CuArray(x)
    y_cu = CuArray(y)

    @test add(y, x) |> typeof <: Array
    @test add(y_cu, x_cu) |> typeof <: CuArray
end
