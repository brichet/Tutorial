#'Test generation'

from Preciprec import *
from math import *
import numpy 



def test_test_snow1():
    params= Preciprec(
    Sdepth_t1 = 0.085,
    Swet_t1 = 5.0,
    Snowaccu = 0.23,
    Sdry = 10.0,
    precip = 5.2,
    rho = 100.0,
    Mrf = 0.27,
    Sdepth = 0.087,
    Swet = 0.03,
    Sdry_t1 = 10.0,
     )
    preciprec_estimated = round(params, 2)
    preciprec_computed = 4.5
    assert (preciprec_estimated == preciprec_computed)