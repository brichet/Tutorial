'Test generation'

from Ptsoil import *
from math import *
import numpy as np



def test_test1():
    params= model_ptsoil(
    tau = 0.9983,
    evapoTranspirationPriestlyTaylor = 449.367,
     )
    energyLimitedEvaporation_estimated = round(params, 3)
    energyLimitedEvaporation_computed = 448.240
    assert (energyLimitedEvaporation_estimated == energyLimitedEvaporation_computed)