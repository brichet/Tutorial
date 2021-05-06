import numpy 
from math import *
def model_SnowAccumulation(float tsmax=0.0,
                           float tmax=0.0,
                           float trmax=0.0,
                           float precip=0.0):
    """

    snowfall accumulation  calculation
    Author: STICS
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float Snowaccu
    # Snow accumulation (unit cm)
    cdef float fs=0.0
    if (tmax < tsmax): fs=1.0
    if ((tmax >= tsmax) and (tmax  <= trmax)):
        fs=(trmax-tmax)/(trmax-tsmax)
    Snowaccu=fs*precip*1/u.d 
    return  Snowaccu
