# coding: utf8
from copy import copy

import numpy
from math import *

def model_TempMin(Sdepth_cm = 0.0,
         prof = 0.0,
         tmin = 0.0,
         tminseuil = 0.0,
         tmaxseuil = 0.0):
    """
     - Name: TempMin -Version: 1.0, -Time step: 1
     - Description:
                 * Title: Minimum temperature  calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: Sdepth_cm
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 500.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : cm
                               ** description : snow depth
                 * name: prof
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 1000
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : cm
                               ** description : snow cover threshold for snow insulation 
                 * name: tmin
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : degC
                               ** description : current minimum air temperature
                 * name: tminseuil
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 5000.0
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : minimum temperature when snow cover is higher than prof
                 * name: tmaxseuil
                               ** parametercategory : constant
                               ** min : 
                               ** datatype : DOUBLE
                               ** max : 
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : maximum temperature when snow cover is higher than prof
     - outputs:
                 * name: tminrec
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : degC
                               ** description : recalculated minimum temperature
    """

    tminrec = tmin
    if Sdepth_cm > prof:
        if tmin < tminseuil:
            tminrec = tminseuil
        else:
            if tmin > tmaxseuil:
                tminrec = tmaxseuil
    else:
        if Sdepth_cm > 0.0:
            tminrec = tminseuil - ((1 - (Sdepth_cm / prof)) * (abs(tmin) + tminseuil))
    return tminrec