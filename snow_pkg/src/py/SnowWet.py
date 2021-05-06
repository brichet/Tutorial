# coding: utf8
from pycropml.units import u
from copy import copy
from array import array
from math import *

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
                               ** description : water in liquid state in the snow cover in previous day
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 100.0
                               ** unit : mmW
                               ** uri : 
                 * name: precip
                               ** description : current precipitation
                               ** inputtype : variable
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : mmW
                               ** uri : 
                 * name: Snowaccu
                               ** description :  snowfall accumulation
                               ** inputtype : variable
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 
                               ** max : 
                               ** unit : mmW/d
                               ** uri : 
                 * name: Mrf
                               ** description : liquid water in the snow cover in the process of refreezing
                               ** inputtype : variable
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 
                               ** max : 
                               ** unit : mmW/d
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
                 * name: Sdry
                               ** description : water in solid state in the snow cover
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW
                               ** uri : 
     - outputs:
                 * name: Swet
                               ** description : water in liquid state in the snow cover
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW
                               ** uri : 
    """

    Swet = 0.0*u.mmW
    if Mrf*u.d <= Swet_t1:
        tmp_swet = Swet_t1 + precip - Snowaccu*u.d + M*u.d - Mrf*u.d
        frac_sdry = 0.1 * Sdry
        if tmp_swet < frac_sdry:
            Swet = tmp_swet
        else:
            Swet = frac_sdry
    return Swet