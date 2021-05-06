cdef float tmp_sdry
Sdry=0.0*u.mmW
if (M*1*u.d  <= Sdry_t1) :
    tmp_sdry=Snowaccu*u.d+Mrf*u.d-M*u.d+Sdry_t1
    if (tmp_sdry  < 0.0): 
        Sdry=0.001*u.mmW
    else:
        Sdry=tmp_sdry