import numpy 
from math import *
def model_TempMax(float Sdepth_cm=0.0,
                  float prof=0.0,
                  float tmax=0.0,
                  float tminseuil=0.0,
                  float tmaxseuil=0.0):
    """

    Maximum temperature  recalculation
    Author: STICS
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float tmaxrec
    tmaxrec=tmax
    if (Sdepth_cm  > prof):
        if(tmax  < tminseuil):
            tmaxrec=tminseuil
        else:
            if (tmax  > tmaxseuil):
                tmaxrec=tmaxseuil
    else:
        if (Sdepth_cm  > 0.0):
            if (tmax  <= 0.0):
                tmaxrec=tmaxseuil-(1-(Sdepth_cm/prof))*(-tmax)
            else:
                tmaxrec=0.0*u.degC
    return  tmaxrec
