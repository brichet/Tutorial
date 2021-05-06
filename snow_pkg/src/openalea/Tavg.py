# coding: utf8
from copy import copy

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
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 500.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : degC
                               ** description : current minimum air temperature
                 * name: tmax
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : degC
                               ** description : current maximum air temperature
     - outputs:
                 * name: tavg
                               ** min : 0.0
                               ** variablecategory : auxiliary
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : degC
                               ** description : mean temperature
    """

    tavg = (tmin + tmax) / 2
    return tavg