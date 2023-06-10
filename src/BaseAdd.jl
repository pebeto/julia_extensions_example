module BaseAdd

function add!(y, x)
    for i in eachindex(y::Array, x::Array)
        @inbounds y[i] += x[i]
    end
    return nothing
end

function add_parallel!(y::Array, x::Array)
    Threads.@threads for i in eachindex(y, x)
        @inbounds y[i] += x[i]
    end
    return nothing
end

export add!, add_parallel!

end
