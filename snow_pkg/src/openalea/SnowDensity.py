# coding: utf8
from copy import copy

import numpy
from math import *

def model_SnowDensity(ps_t1 = 0.0,
         Sdepth_t1 = 0.0,
         Sdry_t1 = 0.0,
         Swet_t1 = 0.0):
    """
     - Name: SnowDensity -Version: 1.0, -Time step: 1
     - Description:
                 * Title: Density of snow cover calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: ps_t1
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : kg/m**3
                               ** description : density of snow cover in previous day
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
                 * name: Sdry_t1
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 500.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : water in solid state in the snow cover in previous day
                 * name: Swet_t1
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : water in liquid state in the snow cover
     - outputs:
                 * name: ps
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : kg/m**3
                               ** description : density of snow cover
    """

    ps = 0.0
    if abs(Sdepth_t1) > 0.0:
        if abs(Sdry_t1 + Swet_t1) > 0.0:
            ps = (Sdry_t1 + Swet_t1) / Sdepth_t1
        else:
            ps = ps_t1
    return ps