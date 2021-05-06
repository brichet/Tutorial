# coding: utf8
from copy import copy

import numpy
from math import *

def model_SnowDry(Sdry_t1 = 0.0,
         Snowaccu = 0.0,
         Mrf = 0.0,
         M = 0.0):
    """
     - Name: SnowDry -Version: 1.0, -Time step: 1
     - Description:
                 * Title: water in solid state in the snow cover Calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
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
                 * name: Snowaccu
                               ** min : 
                               ** default : 0.0
                               ** max : 
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW/d
                               ** description : snowfall accumulation
                 * name: Mrf
                               ** min : 
                               ** default : 0.0
                               ** max : 
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW/d
                               ** description : liquid water in the snow cover in the process of refreezing
                 * name: M
                               ** min : 
                               ** default : 0.0
                               ** max : 
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW/d
                               ** description : snow in the process of melting
     - outputs:
                 * name: Sdry
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW
                               ** description : water in solid state in the snow cover
    """

    Sdry = 0.0
    if M * 1 <= Sdry_t1:
        tmp_sdry = Snowaccu + Mrf - M + Sdry_t1
        if tmp_sdry < 0.0:
            Sdry = 0.001
        else:
            Sdry = tmp_sdry
    return Sdry