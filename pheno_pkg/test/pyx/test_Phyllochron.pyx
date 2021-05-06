#'Test generation'

from Phyllochron import *
from math import *
import numpy 



def test_test_wheat1():
    params= Phyllochron(
    choosePhyllUse = "Default",
    kl = 0.45,
    p = 120.0,
    pincr = 1.25,
    ldecr = 3.0,
    fixPhyll = 91.2,
    pdecr = 0.4,
    ptq = 0.97,
    lincr = 8.0,
     )
    phyllochron_estimated = round(params, 2)
    phyllochron_computed = 36.48
    assert (phyllochron_estimated == phyllochron_computed)