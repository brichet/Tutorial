import numpy 
from math import *
def model_Refreezing(float tavg=0.0,
                     float Tmf=0.0,
                     float SWrf=0.0):
    """

    snowfall accumulation  calculation
    Author: STICS
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float Mrf
    # Mrf calculation
    Mrf=0.0*u.mmW/u.d
    if ( tavg  < Tmf ): 
        Mrf = SWrf * ( Tmf - tavg )
    return  Mrf
