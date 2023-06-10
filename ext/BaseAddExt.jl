module BaseAddExt

using BaseAdd
using CUDA: CuArray, @sync

function BaseAdd.add!(y::CuArray, x::CuArray)
    @sync y .+= x
    return nothing
end

end
