# coding: utf8
from pycropml.units import u
from copy import copy
from array import array
from math import *

import numpy
from math import *

def model_Preciprec(Sdry_t1 = 0.0,
         Sdry = 0.0,
         Swet = 0.0,
         Swet_t1 = 0.0,
         Sdepth_t1 = 0.0,
         Sdepth = 0.0,
         Mrf = 0.0,
         precip = 0.0,
         Snowaccu = 0.0,
         rho = 100.0):
    """
     - Name: Preciprec -Version: 1.0, -Time step: 1
     - Description:
                 * Title: Precipitation ReCalculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: Sdry_t1
                               ** description : water in solid state in the snow cover in previous day
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW
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
                 * name: Swet
                               ** description : water in liquid state in the snow cover
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 100.0
                               ** unit : mmW
                               ** uri : 
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
                 * name: Sdepth
                               ** description : snow cover depth Calculation
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : m
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
                 * name: precip
                               ** description : recalculated precipitation
                               ** inputtype : variable
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : mmW
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
                 * name: preciprec
                               ** description : precipitation recalculation
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW
                               ** uri : 
    """

    preciprec = precip
    if Sdry + Swet < Sdry_t1 + Swet_t1:
        preciprec = preciprec + ((Sdepth_t1 - Sdepth) * rho) - Mrf*u.d
    preciprec = preciprec - Snowaccu*u.d
    return preciprec