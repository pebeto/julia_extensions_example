# Julia extensions example
This simple example shows how to use weak dependencies and package extensions in Julia, introduced in [Julia 1.9](https://julialang.org/blog/2023/04/julia-1.9-highlights/#package_extensions). This incredible feature allows:
- Load packages only when needed (perfect for large dependencies)
- Write functions with multiple dispatch (different implementations for different types)

## Motivation
I don't like the example from the official documentation, because it's not clear how to use it in a real scenario. I've been looking for a simple example, but I couldn't find it. So, I decided to write my own example, and share it with the community.

## Example setup
This example contains a package named BaseAdd, implementing functions that add two arrays. The goal is to implement a function that does the same, but using the GPU.
Our problem begins with the fact that [CUDA.jl](https://cuda.juliagpu.org/stable/) package is a large dependency, increasing the loading time when someone imports it. This gives us the perfect scenario to use weak dependencies and package extensions.

## Package dependencies
As you can see in `Project.toml`, there's no dependency pointing to `CUDA`. It is defined as a weak dependency (`[weakdeps]` section), and loaded in the extension module `BaseAddExt` (`[extensions]` section). In this way, the package `BaseAdd` can be loaded without loading `CUDA`, and if needed, `CUDA` can be loaded later (i.e. calling `add!(y::CuArray, x::CuArray)`).
