# Snow depth calculation
Sdepth=0.0*u.m
if(Snowmelt  <= (Sdepth_t1+Snowaccu*u.d/rho)): 
    Sdepth=(Snowaccu*u.d/rho+Sdepth_t1-Snowmelt-(Sdepth_t1*E*u.d))