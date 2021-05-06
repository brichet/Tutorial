# coding: utf8
from pycropml.units import u
from copy import copy
from array import array
from math import *

from datetime import datetime
from math import *
from Melting import model_Melting
from Refreezing import model_Refreezing
from SnowAccumulation import model_SnowAccumulation
from SnowDensity import model_SnowDensity
from SnowDepth import model_SnowDepth
from SnowDepthTrans import model_SnowDepthTrans
from SnowDry import model_SnowDry
from SnowMelt import model_SnowMelt
from SnowWet import model_SnowWet
from Tavg import model_Tavg
from TempMax import model_TempMax
from TempMin import model_TempMin
from Preciprec import model_Preciprec

def model_Snow(jul = 0,
         tmaxseuil = 0.0,
         tminseuil = 0.0,
         prof = 0.0,
         tmin = 0.0,
         tmax = 0.0,
         precip = 0.0,
         Sdry_t1 = 0.0,
         E = 0.0,
         rho = 100.0,
         Sdepth_t1 = 0.0,
         Pns = 100.0,
         Swet_t1 = 0.0,
         Kmin = 0.0,
         Tmf = 0.0,
         SWrf = 0.0,
         tsmax = 0.0,
         DKmax = 0.0,
         trmax = 0.0,
         ps_t1 = 0.0):
    """
     - Name: Snow -Version: 1.0, -Time step: 1
     - Description:
                 * Title: Snow model
                 * Author: STICS
                 * Reference: Snow paper
                 * Institution: STICS
                 * Abstract: Snow
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
                 * name: tmax
                               ** min : 0.0
                               ** default : 0.0
                               ** max : 100.0
                               ** uri : 
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : degC
                               ** description : current maximum air temperature
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
                 * name: E
                               ** parametercategory : constant
                               ** min : 
                               ** datatype : DOUBLE
                               ** max : 
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : mm/mm/d
                               ** description : snow compaction parameter
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
                 * name: tsmax
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 1000
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : maximum daily air temperature (tmax) below which all precipitation is assumed to be snow
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
                 * name: trmax
                               ** parametercategory : constant
                               ** min : 0.0
                               ** datatype : DOUBLE
                               ** max : 5000.0
                               ** uri : 
                               ** default : 0.0
                               ** inputtype : parameter
                               ** unit : degC
                               ** description : tmax above which all precipitation is assumed to be rain
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
     - outputs:
                 * name: tmaxrec
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : degC
                               ** description : recalculated maximum temperature
                 * name: ps
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : kg/m**3
                               ** description : density of snow cover
                 * name: Mrf
                               ** min : 0.0
                               ** variablecategory : rate
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW/d
                               ** description : liquid water in the snow cover in the process of refreezing
                 * name: tavg
                               ** min : 0.0
                               ** variablecategory : auxiliary
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : degC
                               ** description : mean temperature
                 * name: Swet
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW
                               ** description : water in liquid state in the snow cover
                 * name: Snowmelt
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : m
                               ** description : Snow melt
                 * name: Snowaccu
                               ** min : 0.0
                               ** variablecategory : rate
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW/d
                               ** description : snowfall accumulation
                 * name: Sdry
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW
                               ** description : water in solid state in the snow cover
                 * name: Sdepth
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : m
                               ** description : snow cover depth Calculation
                 * name: tminrec
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : degC
                               ** description : recalculated minimum temperature
                 * name: M
                               ** min : 0.0
                               ** variablecategory : rate
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW/d
                               ** description : snow in the process of melting
                 * name: preciprec
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : mmW
                               ** description : precipitation recalculation
                 * name: Sdepth_cm
                               ** min : 0.0
                               ** variablecategory : state
                               ** max : 500.0
                               ** uri : 
                               ** datatype : DOUBLE
                               ** unit : cm
                               ** description : snow cover depth in cm
    """

    tavg = model_Tavg(tmin, tmax)
    Mrf = model_Refreezing(tavg, Tmf, SWrf)
    M = model_Melting(jul, Tmf, DKmax, Kmin, tavg)
    ps = model_SnowDensity(ps_t1, Sdepth_t1, Sdry_t1, Swet_t1)
    Snowmelt = model_SnowMelt(ps, M)
    Snowaccu = model_SnowAccumulation(tsmax, tmax, trmax, precip)
    Sdepth = model_SnowDepth(Snowmelt, Sdepth_t1, Snowaccu, E, rho)
    Sdepth_cm = model_SnowDepthTrans(Sdepth, Pns)
    tmaxrec = model_TempMax(Sdepth_cm, prof, tmax, tminseuil, tmaxseuil)
    tminrec = model_TempMin(Sdepth_cm, prof, tmin, tminseuil, tmaxseuil)
    Sdry = model_SnowDry(Sdry_t1, Snowaccu, Mrf, M)
    Swet = model_SnowWet(Swet_t1, precip, Snowaccu, Mrf, M, Sdry)
    preciprec = model_Preciprec(Sdry_t1, Sdry, Swet, Swet_t1, Sdepth_t1, Sdepth, Mrf, precip, Snowaccu, rho)
    return (tmaxrec, ps, Mrf, tavg, Swet, Snowmelt, Snowaccu, Sdry, Sdepth, tminrec, M, preciprec, Sdepth_cm)

def init_Snow(jul = 0,
         tmaxseuil = 0.0,
         tminseuil = 0.0,
         prof = 0.0,
         tmin = 0.0,
         tmax = 0.0,
         precip = 0.0,
         E = 0.0,
         rho = 100.0,
         Pns = 100.0,
         Kmin = 0.0,
         Tmf = 0.0,
         SWrf = 0.0,
         tsmax = 0.0,
         DKmax = 0.0,
         trmax = 0.0):
    tmaxrec = 0.0
    ps = 0.0
    Mrf = 0.0
    tavg = 0.0
    Swet = 0.0
    Snowmelt = 0.0
    Snowaccu = 0.0
    Sdry = 0.0
    Sdepth = 0.0
    tminrec = 0.0
    M = 0.0
    preciprec = 0.0
    Sdepth_cm = 0.0
    preciprec = precip
    tminrec = tmin
    tmaxrec = tmax
    return (tmaxrec, ps, Mrf, tavg, Swet, Snowmelt, Snowaccu, Sdry, Sdepth, tminrec, M, preciprec, Sdepth_cm)