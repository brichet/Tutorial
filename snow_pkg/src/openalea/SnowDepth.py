# coding: utf8
from copy import copy

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
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : m
                               ** description : snow melt 
                 * name: Sdepth_t1
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 5000.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : m
                               ** description : snow cover depth Calculation in previous day
                 * name: Snowaccu
                               ** min : 
                               ** default : 0.0
                               ** max : 
                               ** uri : 
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW/d
                               ** description : snowfall accumulation
                 * name: E
                               ** parametercategory : constant
                               ** min : 
                               ** datatype : DOUBLE
                               ** max : 
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : mm/mm/d
                               ** description : snow compaction parameter
                 * name: rho
                               ** parametercategory : constant
                               ** min : 
                               ** datatype : DOUBLE
                               ** max : 
                               ** uri : 
                               ** default : 100
                               ** inputtype : parameter
                               ** unit : kg/m**3
                               ** description : The density of the new snow fixed by the user
     - outputs:
                 * name: Sdepth
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : m
                               ** description : snow cover depth Calculation
    """

    Sdepth = 0.0
    if Snowmelt <= Sdepth_t1 + (Snowaccu / rho):
        Sdepth = Snowaccu / rho + Sdepth_t1 - Snowmelt - (Sdepth_t1 * E)
    return Sdepth