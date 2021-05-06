#'Test generation'

from Refreezing import *
from math import *
import numpy 



def test_test_snow1():
    params= Refreezing(
    tavg = -0.2,
    SWrf = 0.01,
    Tmf = 0.5,
     )
    Mrf_estimated = round(params, 2)
    Mrf_computed = 0.01
    assert (Mrf_estimated == Mrf_computed)