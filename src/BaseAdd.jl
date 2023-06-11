module BaseAdd

function add(y::Array, x::Array)
    for i in eachindex(y, x)
        @inbounds y[i] += x[i]
    end
    return y
end

export add

end
