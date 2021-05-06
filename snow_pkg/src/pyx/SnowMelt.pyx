import numpy 
from math import *
def model_SnowMelt(float ps=0.0,
                   float M=0.0):
    """

    Snow Melt
    Author: STICS
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float Snowmelt
    # Snow melt calculation
    Snowmelt=0.0*u.m
    if( ps  > 1e-8 ):
        Snowmelt = M*u.d  / ps
    return  Snowmelt
