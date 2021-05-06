# coding: utf8
from copy import copy

import numpy
from math import *

def model_SnowAccumulation(tsmax = 0.0,
         tmax = 0.0,
         trmax = 0.0,
         precip = 0.0):
    """
     - Name: SnowAccumulation -Version: 1.0, -Time step: 1
     - Description:
                 * Title: snowfall accumulation  calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: tsmax
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 1000
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : maximum daily air temperature (tmax) below which all precipitation is assumed to be snow
                 * name: tmax
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 5000.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : degC
                               ** description : current maximum air temperature
                 * name: trmax
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 5000.0
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : tmax above which all precipitation is assumed to be rain
                 * name: precip
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 5000.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : recalculated precipitation
     - outputs:
                 * name: Snowaccu
                               ** min : 0.0
                               ** variablecategory : rate
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW/d
                               ** description : snowfall accumulation
    """

    fs = 0.0
    if tmax < tsmax:
        fs = 1.0
    if tmax >= tsmax and tmax <= trmax:
        fs = (trmax - tmax) / (trmax - tsmax)
    Snowaccu = fs * precip * 1
    return Snowaccu