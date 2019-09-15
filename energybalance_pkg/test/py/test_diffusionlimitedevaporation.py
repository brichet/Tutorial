'Test generation'

from Diffusionlimitedevaporation import *
from math import *
import numpy as np



def test_test1():
    params= model_diffusionlimitedevaporation(
    soilDiffusionConstant = 4.2,
    deficitOnTopLayers = 5341,
     )
    diffusionLimitedEvaporation_estimated = round(params, 3)
    diffusionLimitedEvaporation_computed = 6605.505
    assert (diffusionLimitedEvaporation_estimated == diffusionLimitedEvaporation_computed)