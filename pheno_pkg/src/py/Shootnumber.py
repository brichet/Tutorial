# coding: utf8
import numpy
from math import *

def model_shootnumber(canopyShootNumber = 288.0,
         leafNumber = 0.0,
         sowingDensity = 288.0,
         targetFertileShoot = 600.0,
         tilleringProfile = [288.0],
         leafTillerNumberArray = [1],
         tillerNumber = 1):
    #- Description:
    #            - Model Name: CalculateShootNumber Model
    #            - Author: Pierre MARTRE
    #            - Reference: Modeling development phase in the 
    #                Wheat Simulation Model SiriusQuality.
    #                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    #            - Institution: INRA/LEPSE Montpellier
    #            - Abstract: calculate the shoot number and update the related variables if needed
    #- inputs:
    #            - name: canopyShootNumber
    #                          - description : shoot number for the whole canopy
    #                          - variablecategory : state
    #                          - datatype : DOUBLE
    #                          - min : 0
    #                          - max : 10000
    #                          - default : 288.0
    #                          - unit : shoot m-2
    #                          - inputtype : variable
    #            - name: leafNumber
    #                          - description : Leaf number 
    #                          - variablecategory : state
    #                          - inputtype : variable
    #                          - datatype : DOUBLE
    #                          - min : 0
    #                          - max : 10000
    #                          - default : 0
    #                          - unit : leaf
    #            - name: sowingDensity
    #                          - description : number of plant /m²
    #                          - parametercategory : species
    #                          - datatype : DOUBLE
    #                          - min : 0
    #                          - max : 500
    #                          - default : 288.0
    #                          - unit : plant m-2
    #                          - inputtype : parameter
    #            - name: targetFertileShoot
    #                          - description : max value of shoot number for the canopy
    #                          - parametercategory : species
    #                          - datatype : DOUBLE
    #                          - min : 280
    #                          - max : 1000
    #                          - default : 600.0
    #                          - unit : shoot
    #                          - inputtype : variable
    #            - name: tilleringProfile
    #                          - description :  store the amount of new tiller created at each time a new tiller appears
    #                          - variablecategory : state
    #                          - datatype : DOUBLELIST
    #                          - default : [288.0]
    #                          - unit : 
    #                          - inputtype : variable
    #            - name: leafTillerNumberArray
    #                          - description : store the number of tiller for each leaf layer
    #                          - variablecategory : state
    #                          - datatype : INTLIST
    #                          - unit : leaf
    #                          - default : [1]
    #                          - inputtype : variable
    #            - name: tillerNumber
    #                          - description :  Number of tiller which appears
    #                          - variablecategory : state
    #                          - datatype : INT
    #                          - min : 0
    #                          - max : 10000
    #                          - default : 1
    #                          - unit : 
    #                          - inputtype : variable
    #- outputs:
    #            - name: averageShootNumberPerPlant
    #                          - description : average shoot number per plant in the canopy
    #                          - variablecategory : state
    #                          - datatype : DOUBLE
    #                          - min : 0
    #                          - max : 10000
    #                          - unit : shoot m-2
    #            - name: canopyShootNumber
    #                          - description : shoot number for the whole canopy
    #                          - variablecategory : state
    #                          - datatype : DOUBLE
    #                          - min : 0
    #                          - max : 10000
    #                          - unit : shoot m-2
    #            - name: leafTillerNumberArray
    #                          - description : store the number of tiller for each leaf layer
    #                          - variablecategory : state
    #                          - datatype : INTLIST
    #                          - unit : leaf
    #            - name: tilleringProfile
    #                          - description :  store the amount of new tiller created at each time a new tiller appears
    #                          - variablecategory : state
    #                          - datatype : DOUBLELIST
    #                          - unit : 
    #            - name: tillerNumber
    #                          - description :  store the amount of new tiller created at each time a new tiller appears
    #                          - variablecategory : state
    #                          - datatype : INT
    #                          - min : 0
    #                          - max : 10000
    #                          - unit : 
    oldCanopyShootNumber = canopyShootNumber
    emergedLeaves = int(max(1.0, ceil(leafNumber - 1.0)))
    shoots = fibonacci(emergedLeaves)
    canopyShootNumber = min(shoots * sowingDensity, targetFertileShoot)
    averageShootNumberPerPlant = canopyShootNumber / sowingDensity
    if canopyShootNumber != oldCanopyShootNumber:
        tilleringProfile.append(canopyShootNumber - oldCanopyShootNumber)
    tillerNumber = len(tilleringProfile)
    for i in range(len(leafTillerNumberArray) , int(ceil(leafNumber)) , 1):
        leafTillerNumberArray.append(tillerNumber)
    return (averageShootNumberPerPlant, canopyShootNumber, leafTillerNumberArray, tilleringProfile, tillerNumber)

def fibonacci(n):
    result = 0
    b = 1
    for i in range(0 , n , 1):
        temp = result
        result = b
        b = temp + b
    return result