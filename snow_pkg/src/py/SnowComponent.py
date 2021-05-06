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
                               ** description : current day of year for the calculation
                               ** inputtype : variable
                               ** variablecategory : auxiliary
                               ** datatype : INT
                               ** default : 0
                               ** min : 0
                               ** max : 366
                               ** unit : d
                               ** uri : 
                 * name: tmaxseuil
                               ** description : maximum temperature when snow cover is higher than prof
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 
                               ** max : 
                               ** unit : degC
                               ** uri : 
                 * name: tminseuil
                               ** description : minimum temperature when snow cover is higher than prof
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : degC
                               ** uri : 
                 * name: prof
                               ** description : snow cover threshold for snow insulation 
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 1000
                               ** unit : cm
                               ** uri : 
                 * name: tmin
                               ** description : current minimum air temperature
                               ** inputtype : variable
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 100.0
                               ** unit : degC
                               ** uri : 
                 * name: tmax
                               ** description : current maximum air temperature
                               ** inputtype : variable
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 100.0
                               ** unit : degC
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
                 * name: E
                               ** description : snow compaction parameter
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 
                               ** max : 
                               ** unit : mm/mm/d
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
                 * name: Pns
                               ** description : density of the new snow
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 100.0
                               ** min : 
                               ** max : 
                               ** unit : cm/m
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
                 * name: Kmin
                               ** description : minimum melting rate on 21 December
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : mmW/degC/d
                               ** uri : 
                 * name: Tmf
                               ** description : threshold temperature for snow melting 
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : degC
                               ** uri : 
                 * name: SWrf
                               ** description : degree-day temperature index for refreezing
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : mmW/degC/d
                               ** uri : 
                 * name: tsmax
                               ** description : maximum daily air temperature (tmax) below which all precipitation is assumed to be snow
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 1000
                               ** unit : degC
                               ** uri : 
                 * name: DKmax
                               ** description : difference between the maximum and the minimum melting rates
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : mmW/degC/d
                               ** uri : 
                 * name: trmax
                               ** description : tmax above which all precipitation is assumed to be rain
                               ** inputtype : parameter
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 5000.0
                               ** unit : degC
                               ** uri : 
                 * name: ps_t1
                               ** description : density of snow cover in previous day
                               ** inputtype : variable
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** default : 0.0
                               ** min : 0.0
                               ** max : 100.0
                               ** unit : kg/m**3
                               ** uri : 
     - outputs:
                 * name: tmaxrec
                               ** description : recalculated maximum temperature
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : degC
                               ** uri : 
                 * name: ps
                               ** description : density of snow cover
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : kg/m**3
                               ** uri : 
                 * name: Mrf
                               ** description : liquid water in the snow cover in the process of refreezing
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW/d
                               ** uri : 
                 * name: tavg
                               ** description : mean temperature
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : degC
                               ** uri : 
                 * name: Swet
                               ** description : water in liquid state in the snow cover
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW
                               ** uri : 
                 * name: Snowmelt
                               ** description : Snow melt
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : m
                               ** uri : 
                 * name: Snowaccu
                               ** description : snowfall accumulation
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW/d
                               ** uri : 
                 * name: Sdry
                               ** description : water in solid state in the snow cover
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW
                               ** uri : 
                 * name: Sdepth
                               ** description : snow cover depth Calculation
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : m
                               ** uri : 
                 * name: tminrec
                               ** description : recalculated minimum temperature
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : degC
                               ** uri : 
                 * name: M
                               ** description : snow in the process of melting
                               ** variablecategory : rate
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW/d
                               ** uri : 
                 * name: preciprec
                               ** description : precipitation recalculation
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : mmW
                               ** uri : 
                 * name: Sdepth_cm
                               ** description : snow cover depth in cm
                               ** variablecategory : state
                               ** datatype : DOUBLE
                               ** min : 0.0
                               ** max : 500.0
                               ** unit : cm
                               ** uri : 
    """

    tavg = model_Tavg(tmin, tmax)
    Mrf = model_Refreezing(tavg, Tmf, SWrf)
    M = model_Melting(jul, Tmf, DKmax, Kmin, tavg)
    ps = model_SnowDensity(ps_t1, Sdepth_t1, Sdry_t1, Swet_t1)
    Snowmelt = model_SnowMelt(ps, M)
    Snowaccu = model_SnowAccumulation(tsmax, tmax, trmax, precip)
    Sdry = model_SnowDry(Sdry_t1, Snowaccu, Mrf, M)
    Swet = model_SnowWet(Swet_t1, precip, Snowaccu, Mrf, M, Sdry)
    Sdepth = model_SnowDepth(Snowmelt, Sdepth_t1, Snowaccu, E, rho)
    preciprec = model_Preciprec(Sdry_t1, Sdry, Swet, Swet_t1, Sdepth_t1, Sdepth, Mrf, precip, Snowaccu, rho)
    Sdepth_cm = model_SnowDepthTrans(Sdepth, Pns)
    tmaxrec = model_TempMax(Sdepth_cm, prof, tmax, tminseuil, tmaxseuil)
    tminrec = model_TempMin(Sdepth_cm, prof, tmin, tminseuil, tmaxseuil)
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