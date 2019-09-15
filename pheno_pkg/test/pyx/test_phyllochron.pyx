#'Test generation'

from phyllochron import *
from math import *
import numpy 



def test_test_wheat1():
    params= phyllochron(
    lincr = 8.0,
    ldecr = 3.0,
    pdecr = 0.4,
    pincr = 1.25,
    ptq = 0.97,
    kl = 0.45,
    aPTQ = 0.842934,
    phylPTQ1 = 20.0,
    p = 120.0,
    choosePhyllUse = "Default",
    fixPhyll = 91.2,
    gai = 0.279874189539498,
     )
    phyllochron_estimated = round(params[0], 2)
    phyllochron_computed = 36.48
    assert (phyllochron_estimated == phyllochron_computed)
    pastMaxAI_estimated = round(params[1], 2)
    pastMaxAI_computed = 0
    assert (pastMaxAI_estimated == pastMaxAI_computed)