#'Test generation'

from SnowDry import *
from math import *
import numpy 



def test_test_snow1():
    params= SnowDry(
    Snowaccu = 2.0,
    Mrf = 3.0,
    M = 5.0,
    Sdry_t1 = 10.0,
     )
    Sdry_estimated = round(params, 2)
    Sdry_computed = 10.0
    assert (Sdry_estimated == Sdry_computed)