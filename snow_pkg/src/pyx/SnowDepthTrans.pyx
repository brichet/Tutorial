import numpy 
from math import *
def model_SnowDepthTrans(float Sdepth=0.0,
                         float Pns=100.0):
    """

    snow cover depth conversion
    Author: STICS
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float Sdepth_cm
    Sdepth_cm=Sdepth*Pns
    return  Sdepth_cm
