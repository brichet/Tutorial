# coding: utf8
from copy import copy

import numpy
from math import *

def model_SnowWet(Swet_t1 = 0.0,
         precip = 0.0,
         Snowaccu = 0.0,
         Mrf = 0.0,
         M = 0.0,
         Sdry = 0.0):
    """
     - Name: SnowWet -Version: 1.0, -Time step: 1
     - Description:
                 * Title: water in liquid state in the snow cover calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: Swet_t1
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : water in liquid state in the snow cover in previous day
                 * name: precip
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 5000.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : current precipitation
                 * name: Snowaccu
                               ** min : 
                               ** default : 0.0
                               ** max : 
                               ** uri : 
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW/d
                               ** description :  snowfall accumulation
                 * name: Mrf
                               ** min : 
                               ** default : 0.0
                               ** max : 
                               ** uri : 
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW/d
                               ** description : liquid water in the snow cover in the process of refreezing
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
                 * name: Sdry
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 500.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : water in solid state in the snow cover
     - outputs:
                 * name: Swet
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW
                               ** description : water in liquid state in the snow cover
    """

    Swet = 0.0
    if Mrf <= Swet_t1:
        tmp_swet = Swet_t1 + precip - Snowaccu + M - Mrf
        frac_sdry = 0.1 * Sdry
        if tmp_swet < frac_sdry:
            Swet = tmp_swet
        else:
            Swet = frac_sdry
    return Swet