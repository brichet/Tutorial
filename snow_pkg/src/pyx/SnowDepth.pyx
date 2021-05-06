import numpy 
from math import *
def model_SnowDepth(float Snowmelt=0.0,
                    float Sdepth_t1=0.0,
                    float Snowaccu=0.0,
                    float E=0.0,
                    float rho=100.0):
    """

    snow cover depth Calculation
    Author: STICS
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float Sdepth
    # Snow depth calculation
    Sdepth=0.0*u.m
    if(Snowmelt  <= (Sdepth_t1+Snowaccu*u.d/rho)): 
        Sdepth=(Snowaccu*u.d/rho+Sdepth_t1-Snowmelt-(Sdepth_t1*E*u.d))
    return  Sdepth
