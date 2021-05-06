# coding: utf8
from pycropml.units import u
from copy import copy
from array import array
from math import *

import numpy
from math import *

def model_Tavg(tmin = 0.0,
         tmax = 0.0):
    """
     - Name: Tavg -Version: 1.0, -Time step: 1
     - Description:
                 * Title: Mean temperature  calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: tmin
                               ** description : current minimum air temperature
                               ** inputtype : variable
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : degC
                               ** uri : 
                 * name: tmax
                               ** description : current maximum air temperature
                               ** inputtype : variable
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 100.0
                               ** unit : degC
                               ** uri : 
     - outputs:
                 * name: tavg
                               ** description : mean temperature
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : degC
                               ** uri : 
    """

    tavg = (tmin + tmax) / 2
    return tavg