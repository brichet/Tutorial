#'Test generation'

from TempMax import *
from math import *
import numpy 



def test_test_snow1():
    params= TempMax(
    prof = 10.0,
    tmax = -0.3,
    tminseuil = -0.5,
    Sdepth_cm = 2.0,
    tmaxseuil = 0.0,
     )
    tmaxrec_estimated = round(params, 2)
    tmaxrec_computed = -0.24
    assert (tmaxrec_estimated == tmaxrec_computed)