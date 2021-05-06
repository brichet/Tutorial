# coding: utf8
from pycropml.units import u
from copy import copy
from array import array
from math import *

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
                               ** description : density of snow cover
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : kg/m**3
                               ** uri : 
                 * name: M
                               ** description : snow in the process of melting
                               ** inputtype : variable
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 
                               ** max : 
                               ** unit : mmW/d
                               ** uri : 
     - outputs:
                 * name: Snowmelt
                               ** description : Snow melt
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : m
                               ** uri : 
    """

    Snowmelt = 0.0*u.m
    if ps > 1e-8:
        Snowmelt = M*u.d / ps
    return Snowmelt