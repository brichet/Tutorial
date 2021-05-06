#'Test generation'

from SoilHeatFlux import *
from math import *
import numpy 



def test_test1():
    params= SoilHeatFlux(
    soilEvaporation = 448.240,
    tau = 0.9983,
    netRadiationEquivalentEvaporation = 638.142,
     )
    soilHeatFlux_estimated = round(params, 3)
    soilHeatFlux_computed = 188.817
    assert (soilHeatFlux_estimated == soilHeatFlux_computed)