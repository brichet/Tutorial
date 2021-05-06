#'Test generation'

from TempMin import *
from math import *
import numpy 



def test_test_snow1():
    params= TempMin(
    prof = 10.0,
    tminseuil = -0.5,
    tmin = -0.05,
    Sdepth_cm = 5.2,
    tmaxseuil = 0.0,
     )
    tminrec_estimated = round(params, 2)
    tminrec_computed = -0.28
    assert (tminrec_estimated == tminrec_computed)