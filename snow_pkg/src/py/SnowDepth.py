# coding: utf8
from pycropml.units import u
from copy import copy
from array import array
from math import *

import numpy
from math import *

def model_SnowDepth(Snowmelt = 0.0,
         Sdepth_t1 = 0.0,
         Snowaccu = 0.0,
         E = 0.0,
         rho = 100.0):
    """
     - Name: SnowDepth -Version: 1.0, -Time step: 1
     - Description:
                 * Title: snow cover depth Calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: Snowmelt
                               ** description : snow melt 
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 100.0
                               ** unit : m
                               ** uri : 
                 * name: Sdepth_t1
                               ** description : snow cover depth Calculation in previous day
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : m
                               ** uri : 
                 * name: Snowaccu
                               ** description : snowfall accumulation
                               ** inputtype : variable
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 
                               ** max : 
                               ** unit : mmW/d
                               ** uri : 
                 * name: E
                               ** description : snow compaction parameter
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 
                               ** max : 
                               ** unit : mm/mm/d
                               ** uri : 
                 * name: rho
                               ** description : The density of the new snow fixed by the user
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 100
                               ** min : 
                               ** max : 
                               ** unit : kg/m**3
                               ** uri : 
     - outputs:
                 * name: Sdepth
                               ** description : snow cover depth Calculation
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : m
                               ** uri : 
    """

    Sdepth = 0.0*u.m
    if Snowmelt <= Sdepth_t1 + (Snowaccu*u.d / rho):
        Sdepth = Snowaccu*u.d / rho + Sdepth_t1 - Snowmelt - (Sdepth_t1 * E*u.d)
    return Sdepth