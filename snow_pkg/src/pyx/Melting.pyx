import numpy 
from math import *
def model_Melting(int jul=0,
                  float Tmf=0.5,
                  float DKmax=0.0,
                  float Kmin=0.0,
                  float tavg=0.0):
    """

    snow in the process of melting
    Author: STICS
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float M
    # M calculation
    cdef float K
    M = 0.0*u.mmW/u.d
    K=(DKmax/2.0)*(-sin((2.0*pi*float(jul)/366.0)+(9.0/16.0)*pi)) +Kmin+(DKmax/2.0)
    if ( tavg  > Tmf ): 
        M = K * ( tavg - Tmf )
    return  M
