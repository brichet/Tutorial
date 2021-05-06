#'Test generation'

from Melting import *
from math import *
import numpy 



def test_test_snow1():
    params= Melting(
    tavg = 1.5,
    jul = 1,
    DKmax = 1.5,
    Tmf = 0.5,
    Kmin = 2.0,
     )
    M_estimated = round(params, 2)
    M_computed = 2.02
    assert (M_estimated == M_computed)