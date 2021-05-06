#'Test generation'

from SnowDensity import *
from math import *
import numpy 



def test_test_snow1():
    params= SnowDensity(
    Sdry_t1 = 0.05,
    Sdepth_t1 = 0.010,
    ps_t1 = 200,
    Swet_t1 = 2,
     )
    ps_estimated = round(params, 2)
    ps_computed = 205
    assert (ps_estimated == ps_computed)