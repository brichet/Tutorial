#'Test generation'

from SnowAccumulation import *
from math import *
import numpy 



def test_test_snow1():
    params= SnowAccumulation(
    trmax = 1.0,
    tmax = -1.0,
    precip = 0.5,
    tsmax = -2.0,
     )
    Snowaccu_estimated = round(params, 2)
    Snowaccu_computed = 0.33
    assert (Snowaccu_estimated == Snowaccu_computed)