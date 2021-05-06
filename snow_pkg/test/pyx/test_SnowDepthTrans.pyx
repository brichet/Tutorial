#'Test generation'

from SnowDepthTrans import *
from math import *
import numpy 



def test_test_snow1():
    params= SnowDepthTrans(
    Pns = 100.0,
    Sdepth = 0.050,
     )
    Sdepth_cm_estimated = round(params, 2)
    Sdepth_cm_computed = 5
    assert (Sdepth_cm_estimated == Sdepth_cm_computed)