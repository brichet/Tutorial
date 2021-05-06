# coding: utf8
from copy import copy

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
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 500.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : water in solid state in the snow cover in previous day
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
                 * name: Swet
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : mmW
                               ** description : water in liquid state in the snow cover
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
                 * name: Sdepth
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 5000.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : m
                               ** description : snow cover depth Calculation
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
                 * name: preciprec
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW
                               ** description : precipitation recalculation
    """

    preciprec = precip
    if Sdry + Swet < Sdry_t1 + Swet_t1:
        preciprec = preciprec + ((Sdepth_t1 - Sdepth) * rho) - Mrf
    preciprec = preciprec - Snowaccu
    return preciprec