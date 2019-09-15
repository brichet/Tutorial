#'Test generation'

from shootnumber import *
from math import *
import numpy 



def test_test_wheat1():
    params= shootnumber(
    targetFertileShoot = 600.0,
    sowingDensity = 288.0,
    canopyShootNumber = 288.0,
    leafNumber = 3.34348137255,
    leafTillerNumberArray = [1, 1, 1],
    tilleringProfile = [288.0],
     )
    averageShootNumberPerPlant_estimated = round(params[0], 2)
    averageShootNumberPerPlant_computed = 2
    assert (averageShootNumberPerPlant_estimated == averageShootNumberPerPlant_computed)
    canopyShootNumber_estimated = round(params[1], 1)
    canopyShootNumber_computed = 576
    assert (canopyShootNumber_estimated == canopyShootNumber_computed)
    leafTillerNumberArray_estimated = params[2]
    leafTillerNumberArray_computed = [1, 1, 1, 2]
    assert np.all(leafTillerNumberArray_estimated == leafTillerNumberArray_computed)
    tilleringProfile_estimated = np.around(params[3], 2)
    tilleringProfile_computed = [288.0, 288.0]
    assert np.all(tilleringProfile_estimated == tilleringProfile_computed)
    tillerNumber_estimated = params[4]
    tillerNumber_computed = 2
    assert (tillerNumber_estimated == tillerNumber_computed)