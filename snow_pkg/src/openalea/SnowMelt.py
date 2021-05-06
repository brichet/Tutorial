# coding: utf8
from copy import copy

import numpy
from math import *

def model_SnowMelt(ps = 0.0,
         M = 0.0):
    """
     - Name: SnowMelt -Version: 1.0, -Time step: 1
     - Description:
                 * Title: Snow Melt
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: ps
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 5000.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : kg/m**3
                               ** description : density of snow cover
                 * name: M
                               ** min : 
                               ** default : 0.0
                               ** max : 
                               ** uri : 
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW/d
                               ** description : snow in the process of melting
     - outputs:
                 * name: Snowmelt
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : m
                               ** description : Snow melt
    """

    Snowmelt = 0.0
    if ps > 1e-8:
        Snowmelt = M / ps
    return Snowmelt