# coding: utf8
from copy import copy

import numpy
from math import *

def model_Melting(jul = 0,
         Tmf = 0.5,
         DKmax = 0.0,
         Kmin = 0.0,
         tavg = 0.0):
    """
     - Name: Melting -Version: 1.0, -Time step: 1
     - Description:
                 * Title: snow in the process of melting
                 * Author: STICS
                 * Reference: -
                 * Institution: INRA
                 * Abstract: -
     - inputs:
                 * name: jul
                               ** min : 0
                               ** default : 0
                               ** max : 366
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : INT
                               ** inputtype : variable
                               ** unit : d
                               ** description : current day of year for the calculation
                 * name: Tmf
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 1.0
                               ** uri : 
                               ** default : 0.5
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : threshold temperature for snow melting 
                 * name: DKmax
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 5000.0
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : mmW/degC/d
                               ** description : difference between the maximum and the minimum melting rates
                 * name: Kmin
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 5000.0
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : mmW/degC/d
                               ** description : minimum melting rate on 21 December
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
     - outputs:
                 * name: M
                               ** min : 0.0
                               ** variablecategory : rate
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW/d
                               ** description : snow in the process of melting
    """

    M = 0.0
    K = DKmax / 2.0 * -sin((2.0 * pi * float(jul) / 366.0 + (9.0 / 16.0 * pi))) + Kmin + (DKmax / 2.0)
    if tavg > Tmf:
        M = K * (tavg - Tmf)
    return M