#'Test generation'

from SnowDepth import *
from math import *
import numpy 



def test_test_snow1():
    params= SnowDepth(
    Snowaccu = 5,
    E = 0.02,
    Sdepth_t1 = 0.05,
    rho = 100.0,
    Snowmelt = 0.012,
     )
    Sdepth_estimated = round(params, 2)
    Sdepth_computed = 0.09
    assert (Sdepth_estimated == Sdepth_computed)