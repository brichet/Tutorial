#'Test generation'

from UpdatePhase import *
from math import *
import numpy 



def test_test_wheat1():
    params= UpdatePhase(
    pHEADANTH = 1.0,
    maxDL = 15.0,
    ignoreGrainMaturation = TRUE,
    dcd = 100.0,
    isVernalizable = 1,
    p = 120,
    choosePhyllUse = "Default",
    sLDL = 0.85,
    hasLastPrimordiumAppeared_t1 = 0,
    dse = 105.0,
    phase_t1 = 1,
    degfm = 0.0,
     )
    finalLeafNumber_estimated = round(params[0], 2)
    finalLeafNumber_computed = 8.80
    assert (finalLeafNumber_estimated == finalLeafNumber_computed)
    phase_estimated = round(params[1], 1)
    phase_computed = 2
    assert (phase_estimated == phase_computed)
    hasLastPrimordiumAppeared_estimated = params[2]
    hasLastPrimordiumAppeared_computed = 1
    assert (hasLastPrimordiumAppeared_estimated == hasLastPrimordiumAppeared_computed)