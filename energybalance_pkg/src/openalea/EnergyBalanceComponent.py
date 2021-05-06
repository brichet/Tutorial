# coding: utf8
from pycropml.units import u
from copy import copy
from array import array
from math import *

from datetime import datetime
from math import *
from NetRadiation import model_NetRadiation
from NetRadiationEquivalentEvaporation import model_NetRadiationEquivalentEvaporation
from PriestlyTaylor import model_PriestlyTaylor
from Conductance import model_Conductance
from DiffusionLimitedEvaporation import model_DiffusionLimitedEvaporation
from Penman import model_Penman
from PtSoil import model_PtSoil
from SoilEvaporation import model_SoilEvaporation
from EvapoTranspiration import model_EvapoTranspiration
from SoilHeatFlux import model_SoilHeatFlux
from PotentialTranspiration import model_PotentialTranspiration
from CropHeatFlux import model_CropHeatFlux
from CanopyTemperature import model_CanopyTemperature

def model_EnergyBalance(minTair = 0.7,
         maxTair = 7.2,
         albedoCoefficient = 0.23,
         stefanBoltzman = 4.903e-09,
         elevation = 0.0,
         solarRadiation = 3.0,
         vaporPressure = 6.1,
         extraSolarRadiation = 11.7,
         lambdaV = 2.454,
         hslope = 0.584,
         psychrometricConstant = 0.66,
         Alpha = 1.5,
         vonKarman = 0.42,
         heightWeatherMeasurements = 2.0,
         zm = 0.13,
         d = 0.67,
         zh = 0.013,
         plantHeight = 0.0,
         wind = 124000.0,
         deficitOnTopLayers = 5341.0,
         soilDiffusionConstant = 4.2,
         VPDair = 2.19,
         rhoDensityAir = 1.225,
         specificHeatCapacityAir = 0.00101,
         tau = 0.9983,
         tauAlpha = 0.3,
         isWindVpDefined = 1):
    """
     - Name: EnergyBalance -Version: 001, -Time step: 1
     - Description:
                 * Title: EnergyBalance
                 * Author: Pierre MARTRE
                 * Reference: Modelling energy balance in the wheat crop model SiriusQuality2: Evapotranspiration and canopy and soil temperature calculations
                 * Institution: INRA/LEPSE
                 * Abstract: see documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=547
     - inputs:
                 * name: minTair
                               ** min : -30
                               ** default : 0.7
                               ** max : 45
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : °C
                               ** description : minimum air temperature
                 * name: maxTair
                               ** min : -30
                               ** default : 7.2
                               ** max : 45
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : °C
                               ** description : maximum air Temperature
                 * name: albedoCoefficient
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.23
                               ** inputtype : parameter
                               ** unit : 
                               ** description : albedo Coefficient
                 * name: stefanBoltzman
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 4.903E-09
                               ** inputtype : parameter
                               ** unit : 
                               ** description : stefan Boltzman constant
                 * name: elevation
                               ** parametercategory : constant
                               ** min : -500
                               ** datatype : DOUBLE
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0
                               ** inputtype : parameter
                               ** unit : m
                               ** description : elevation
                 * name: solarRadiation
                               ** min : 0
                               ** default : 3
                               ** max : 1000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : MJ m-2 d-1
                               ** description : solar Radiation
                 * name: vaporPressure
                               ** min : 0
                               ** default : 6.1
                               ** max : 1000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : hPa
                               ** description : vapor Pressure
                 * name: extraSolarRadiation
                               ** min : 0
                               ** default : 11.7
                               ** max : 1000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : MJ m2 d-1
                               ** description : extra Solar Radiation
                 * name: lambdaV
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 10
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 2.454
                               ** inputtype : parameter
                               ** unit : MJ kg-1
                               ** description : latent heat of vaporization of water
                 * name: hslope
                               ** min : 0
                               ** default : 0.584
                               ** max : 1000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : hPa °C-1
                               ** description : the slope of saturated vapor pressure temperature curve at a given temperature 
                 * name: psychrometricConstant
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.66
                               ** inputtype : parameter
                               ** unit : 
                               ** description : psychrometric constant
                 * name: Alpha
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 100
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 1.5
                               ** inputtype : parameter
                               ** unit : 
                               ** description : Priestley-Taylor evapotranspiration proportionality constant
                 * name: vonKarman
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.42
                               ** inputtype : parameter
                               ** unit : dimensionless
                               ** description : von Karman constant
                 * name: heightWeatherMeasurements
                               ** parametercategory : soil
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 10
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 2
                               ** inputtype : parameter
                               ** unit : m
                               ** description : reference height of wind and humidity measurements
                 * name: zm
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.13
                               ** inputtype : parameter
                               ** unit : m
                               ** description : roughness length governing momentum transfer, FAO
                 * name: d
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547rl
                               ** default : 0.67
                               ** inputtype : parameter
                               ** unit : dimensionless
                               ** description : corresponding to 2/3. This is multiplied to the crop heigth for calculating the zero plane displacement height, FAO
                 * name: zh
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.013
                               ** inputtype : parameter
                               ** unit : m
                               ** description : roughness length governing transfer of heat and vapour, FAO
                 * name: plantHeight
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0
                               ** variablecategory : auxiliary
                               ** inputtype : variable
                               ** unit : mm
                               ** description : plant Height
                 * name: wind
                               ** min : 0
                               ** default : 124000
                               ** max : 1000000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : m/d
                               ** description : wind
                 * name: deficitOnTopLayers
                               ** min : 0
                               ** default : 5341
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : g m-2 d-1
                               ** description : deficit On TopLayers
                 * name: soilDiffusionConstant
                               ** parametercategory : soil
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 10
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 4.2
                               ** inputtype : parameter
                               ** unit : 
                               ** description : soil Diffusion Constant
                 * name: VPDair
                               ** min : 0
                               ** default : 2.19
                               ** max : 1000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : auxiliary
                               ** datatype : DOUBLE
                               ** inputtype : variable
                               ** unit : hPa
                               ** description :  vapour pressure density
                 * name: rhoDensityAir
                               ** parametercategory : constant
                               ** datatype : DOUBLE
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 1.225
                               ** inputtype : parameter
                               ** unit : kg/m**3
                               ** description : Density of air
                 * name: specificHeatCapacityAir
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.00101
                               ** inputtype : parameter
                               ** unit : (MJ/kg)/degC
                               ** description : Specific heat capacity of dry air
                 * name: tau
                               ** parametercategory : species
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 100
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.9983
                               ** inputtype : parameter
                               ** unit : 
                               ** description : plant cover factor
                 * name: tauAlpha
                               ** parametercategory : soil
                               ** min : 0
                               ** datatype : DOUBLE
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 0.3
                               ** inputtype : parameter
                               ** unit : 
                               ** description : Fraction of the total net radiation exchanged at the soil surface when AlpaE = 1
                 * name: isWindVpDefined
                               ** parametercategory : constant
                               ** min : 0
                               ** datatype : INT
                               ** max : 1
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** default : 1
                               ** inputtype : parameter
                               ** unit : 
                               ** description : if wind and vapour pressure are defined
     - outputs:
                 * name: netRadiation
                               ** min : 0
                               ** variablecategory : auxiliary
                               ** max : 5000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : MJ m-2 d-1
                               ** description :  net radiation 
                 * name: netOutGoingLongWaveRadiation
                               ** min : 0
                               ** variablecategory : auxiliary
                               ** max : 5000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : net OutGoing Long Wave Radiation 
                 * name: netRadiationEquivalentEvaporation
                               ** min : 0
                               ** variablecategory : auxiliary
                               ** max : 5000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : net Radiation in Equivalent Evaporation 
                 * name: evapoTranspirationPriestlyTaylor
                               ** min : 0
                               ** variablecategory : rate
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : evapoTranspiration of Priestly Taylor 
                 * name: diffusionLimitedEvaporation
                               ** min : 0
                               ** variablecategory : state
                               ** max : 5000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : the evaporation from the diffusion limited soil 
                 * name: energyLimitedEvaporation
                               ** min : 0
                               ** variablecategory : auxiliary
                               ** max : 5000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : energy Limited Evaporation 
                 * name: conductance
                               ** min : 0
                               ** variablecategory : state
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : m/d
                               ** description : the boundary layer conductance
                 * name: evapoTranspirationPenman
                               ** min : 0
                               ** variablecategory : rate
                               ** max : 5000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g/m**2/d
                               ** description :  evapoTranspiration of Penman Monteith
                 * name: soilEvaporation
                               ** min : 0
                               ** variablecategory : auxiliary
                               ** max : 5000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : soil Evaporation
                 * name: evapoTranspiration
                               ** min : 0
                               ** variablecategory : rate
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : mm
                               ** description : evapoTranspiration
                 * name: potentialTranspiration
                               ** min : 0
                               ** variablecategory : rate
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : potential Transpiration 
                 * name: soilHeatFlux
                               ** min : 0
                               ** variablecategory : rate
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description : soil Heat Flux 
                 * name: cropHeatFlux
                               ** min : 0
                               ** variablecategory : rate
                               ** max : 10000
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** datatype : DOUBLE
                               ** unit : g m-2 d-1
                               ** description :  crop Heat Flux
                 * name: minCanopyTemperature
                               ** min : -30
                               ** datatype : DOUBLE
                               ** max : 45
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : state
                               ** unit : degC
                               ** description : minimal Canopy Temperature  
                 * name: maxCanopyTemperature
                               ** min : -30
                               ** datatype : DOUBLE
                               ** max : 45
                               ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
                               ** variablecategory : state
                               ** unit : degC
                               ** description : maximal Canopy Temperature 
    """

    (netRadiation, netOutGoingLongWaveRadiation) = model_NetRadiation(minTair, maxTair, albedoCoefficient, stefanBoltzman, elevation, solarRadiation, vaporPressure, extraSolarRadiation)
    netRadiationEquivalentEvaporation = model_NetRadiationEquivalentEvaporation(lambdaV, netRadiation)
    evapoTranspirationPriestlyTaylor = model_PriestlyTaylor(netRadiationEquivalentEvaporation, hslope, psychrometricConstant, Alpha)
    energyLimitedEvaporation = model_PtSoil(evapoTranspirationPriestlyTaylor, Alpha, tau, tauAlpha)
    diffusionLimitedEvaporation = model_DiffusionLimitedEvaporation(deficitOnTopLayers, soilDiffusionConstant)
    soilEvaporation = model_SoilEvaporation(diffusionLimitedEvaporation, energyLimitedEvaporation)
    soilHeatFlux = model_SoilHeatFlux(netRadiationEquivalentEvaporation, tau, soilEvaporation)
    conductance = model_Conductance(vonKarman, heightWeatherMeasurements, zm, zh, d, plantHeight, wind)
    evapoTranspirationPenman = model_Penman(evapoTranspirationPriestlyTaylor, hslope, VPDair, psychrometricConstant, Alpha, lambdaV, rhoDensityAir, specificHeatCapacityAir, conductance)
    evapoTranspiration = model_EvapoTranspiration(isWindVpDefined, evapoTranspirationPriestlyTaylor, evapoTranspirationPenman)
    potentialTranspiration = model_PotentialTranspiration(evapoTranspiration, tau)
    cropHeatFlux = model_CropHeatFlux(netRadiationEquivalentEvaporation, soilHeatFlux, potentialTranspiration)
    (minCanopyTemperature, maxCanopyTemperature) = model_CanopyTemperature(minTair, maxTair, cropHeatFlux, conductance, lambdaV, rhoDensityAir, specificHeatCapacityAir)
    return (netRadiation, netOutGoingLongWaveRadiation, netRadiationEquivalentEvaporation, evapoTranspirationPriestlyTaylor, diffusionLimitedEvaporation, energyLimitedEvaporation, conductance, evapoTranspirationPenman, soilEvaporation, evapoTranspiration, potentialTranspiration, soilHeatFlux, cropHeatFlux, minCanopyTemperature, maxCanopyTemperature)