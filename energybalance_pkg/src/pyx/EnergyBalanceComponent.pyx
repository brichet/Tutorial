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
def model_EnergyBalance(float minTair=0.7,
      float maxTair=7.2,
      float albedoCoefficient=0.23,
      float stefanBoltzman=4.903e-09,
      float elevation=0.0,
      float solarRadiation=3.0,
      float vaporPressure=6.1,
      float extraSolarRadiation=11.7,
      float lambdaV=2.454,
      float hslope=0.584,
      float psychrometricConstant=0.66,
      float Alpha=1.5,
      float vonKarman=0.42,
      float heightWeatherMeasurements=2.0,
      float zm=0.13,
      float d=0.67,
      float zh=0.013,
      float plantHeight=0.0,
      float wind=124000.0,
      float deficitOnTopLayers=5341.0,
      float soilDiffusionConstant=4.2,
      float VPDair=2.19,
      float rhoDensityAir=1.225,
      float specificHeatCapacityAir=0.00101,
      float tau=0.9983,
      float tauAlpha=0.3,
      int isWindVpDefined=1):
    cdef float diffusionLimitedEvaporation
    cdef float energyLimitedEvaporation
    cdef float soilEvaporation
    cdef float cropHeatFlux
    cdef float conductance
    cdef float minCanopyTemperature
    cdef float maxCanopyTemperature
    cdef float evapoTranspiration
    cdef float potentialTranspiration
    cdef float netRadiationEquivalentEvaporation
    cdef float evapoTranspirationPriestlyTaylor
    cdef float soilHeatFlux
    cdef float netRadiation
    cdef float netOutGoingLongWaveRadiation
    cdef float evapoTranspirationPenman
    netRadiation, netOutGoingLongWaveRadiation = model_NetRadiation( minTair,maxTair,albedoCoefficient,stefanBoltzman,elevation,solarRadiation,vaporPressure,extraSolarRadiation)
    netRadiationEquivalentEvaporation = model_NetRadiationEquivalentEvaporation( lambdaV,netRadiation)
    evapoTranspirationPriestlyTaylor = model_PriestlyTaylor( netRadiationEquivalentEvaporation,hslope,psychrometricConstant,Alpha)
    energyLimitedEvaporation = model_PtSoil( evapoTranspirationPriestlyTaylor,Alpha,tau,tauAlpha)
    diffusionLimitedEvaporation = model_DiffusionLimitedEvaporation( deficitOnTopLayers,soilDiffusionConstant)
    soilEvaporation = model_SoilEvaporation( diffusionLimitedEvaporation,energyLimitedEvaporation)
    soilHeatFlux = model_SoilHeatFlux( netRadiationEquivalentEvaporation,tau,soilEvaporation)
    conductance = model_Conductance( vonKarman,heightWeatherMeasurements,zm,zh,d,plantHeight,wind)
    evapoTranspirationPenman = model_Penman( evapoTranspirationPriestlyTaylor,hslope,VPDair,psychrometricConstant,Alpha,lambdaV,rhoDensityAir,specificHeatCapacityAir,conductance)
    evapoTranspiration = model_EvapoTranspiration( isWindVpDefined,evapoTranspirationPriestlyTaylor,evapoTranspirationPenman)
    potentialTranspiration = model_PotentialTranspiration( evapoTranspiration,tau)
    cropHeatFlux = model_CropHeatFlux( netRadiationEquivalentEvaporation,soilHeatFlux,potentialTranspiration)
    minCanopyTemperature, maxCanopyTemperature = model_CanopyTemperature( minTair,maxTair,cropHeatFlux,conductance,lambdaV,rhoDensityAir,specificHeatCapacityAir)
    return netRadiation, netOutGoingLongWaveRadiation, netRadiationEquivalentEvaporation, evapoTranspirationPriestlyTaylor, diffusionLimitedEvaporation, energyLimitedEvaporation, conductance, evapoTranspirationPenman, soilEvaporation, evapoTranspiration, potentialTranspiration, soilHeatFlux, cropHeatFlux, minCanopyTemperature, maxCanopyTemperature