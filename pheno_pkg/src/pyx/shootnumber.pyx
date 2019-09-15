import numpy 
from math import *

def model_shootnumber(float canopyShootNumber=288.0,
                      float leafNumber=0.0,
                      float sowingDensity=288.0,
                      float targetFertileShoot=600.0,
                      list tilleringProfile=[288.0],
                      list leafTillerNumberArray=[1],
                      int tillerNumber=1):
    """

    CalculateShootNumber Model
    Author: Pierre MARTRE
    Reference: Modeling development phase in the 
                Wheat Simulation Model SiriusQuality.
                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    Institution: INRA/LEPSE Montpellier
    Abstract: calculate the shoot number and update the related variables if needed

    """
    cdef float averageShootNumberPerPlant
    cdef float oldCanopyShootNumber
    cdef int emergedLeaves, shoots, i
    oldCanopyShootNumber = canopyShootNumber
    emergedLeaves = int(max(1.0, ceil(leafNumber - 1.0)))
    shoots = fibonacci(emergedLeaves)
    canopyShootNumber = min(shoots * sowingDensity, targetFertileShoot)
    averageShootNumberPerPlant = canopyShootNumber / sowingDensity
    if (canopyShootNumber != oldCanopyShootNumber):
        tilleringProfile.append(canopyShootNumber - oldCanopyShootNumber)
    tillerNumber = len(tilleringProfile)
    for i in range(len(leafTillerNumberArray),int(ceil(leafNumber)),1):
        leafTillerNumberArray.append(tillerNumber)
    return  averageShootNumberPerPlant, canopyShootNumber, leafTillerNumberArray, tilleringProfile, tillerNumber
def fibonacci(int n):
    cdef int result 
    cdef int b
    cdef int i, temp
    result = 0
    b = 1
    for i in range(0 , n , 1):
        temp = result
        result = b
        b = temp + b
    return result
