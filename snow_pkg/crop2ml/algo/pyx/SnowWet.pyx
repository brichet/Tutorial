cdef float frac_sdry, tmp_swet
Swet=0.0*u.mmW
if (Mrf*u.d  <= Swet_t1) :
    tmp_swet=Swet_t1+(precip-Snowaccu*u.d)+M*u.d-Mrf*u.d
    frac_sdry=0.1*Sdry
    if (tmp_swet  < frac_sdry):
        Swet=tmp_swet
    else:
        Swet=frac_sdry