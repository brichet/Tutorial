#'Test generation'

from SnowWet import *
from math import *
import numpy 



def test_test_snow1():
    params= SnowWet(
    Snowaccu = 2.0,
    Sdry = 0.279,
    precip = 1.2,
    Mrf = 2.0,
    M = 0.0,
    Swet_t1 = 5.0,
     )
    Swet_estimated = round(params, 2)
    Swet_computed = 0.03
    assert (Swet_estimated == Swet_computed)