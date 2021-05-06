# coding: utf8
from copy import copy

import numpy
from math import *

def model_Refreezing(tavg = 0.0,
         Tmf = 0.0,
         SWrf = 0.0):
    """
     - Name: Refreezing -Version: 1.0, -Time step: 1
     - Description:
                 * Title: snowfall accumulation  calculation
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: tavg
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : degC
                               ** description : average temperature
                 * name: Tmf
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 5000.0
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : threshold temperature for snow melting 
                 * name: SWrf
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 5000.0
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : mmW/degC/d
                               ** description : degree-day temperature index for refreezing
     - outputs:
                 * name: Mrf
                               ** min : 0.0
                               ** variablecategory : rate
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW/d
                               ** description : liquid water in the snow cover in the process of refreezing
    """

    Mrf = 0.0
    if tavg < Tmf:
        Mrf = SWrf * (Tmf - tavg)
    return Mrf