# Snow melt calculation
Snowmelt=0.0*u.m
if( ps  > 1e-8 ):
    Snowmelt = M*u.d  / ps