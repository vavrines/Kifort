#--- 1d1f1v ---#
function flux_kcu!(
    fw::X,
    ff::Y,
    fL::A,
    fR::A,
    u::B,
    ω::B,
    nu,
    inK,
    γ,
    visRef,
    visIdx,
    Pr,
    dt,
    sfL = zeros(eltype(hL), axes(hL))::A,
    sfR = zeros(eltype(hL), axes(hL))::A,
) where {
    X<:AbstractArray{<:AbstractFloat,1},
    Y<:AbstractArray{<:AbstractFloat,1},
    A<:AbstractArray{<:AbstractFloat,1},
    B<:AbstractArray{<:AbstractFloat,1},
}
    ccall(
        (:__kinetic_MOD_flux_kcu_1f1v, "kitmod.so"),
        Nothing,
        (Ref{Float64}, Ref{Float64},
        Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64},
        Ref{Int}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}, Ref{Float64}),
        fw,
        ff,
        fL,
        fR,
        u,
        ω,
        nu,
        inK,
        γ,
        visRef,
        visIdx,
        Pr,
        dt,
        sfL,
        sfR,
    )
end