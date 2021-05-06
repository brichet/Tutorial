# coding: utf8
from copy import copy

import numpy
from math import *

def model_SnowDepthTrans(Sdepth = 0.0,
         Pns = 100.0):
    """
     - Name: SnowDepthTrans -Version: 1.0, -Time step: 1
     - Description:
                 * Title: snow cover depth conversion
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: Sdepth
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 500.0
                               ** uri : 
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : m
                               ** description : snow cover depth Calculation
                 * name: Pns
                               ** parametercategory : constant
                               ** min : 
                               ** datatype : DOUBLE
                               ** max : 
                               ** uri : 
                               ** default : 100.0
                               ** inputtype : parameter
                               ** unit : cm/m
                               ** description : density of the new snow
     - outputs:
                 * name: Sdepth_cm
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : cm
                               ** description : snow cover depth in cm
    """

    Sdepth_cm = Sdepth * Pns
    return Sdepth_cm