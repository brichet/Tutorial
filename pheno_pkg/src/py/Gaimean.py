# coding: utf8
import numpy
from math import *

def model_gaimean(gAI = 0.0,
         tTWindowForPTQ = 0.0,
         deltaTT = 0.0,
         pastMaxAI = 0.0,
         listTTShootWindowForPTQ = [0.0],
         listGAITTWindowForPTQ = [0.0]):
    #- Description:
    #            * Title: Average GAI on a specific thermal time window
    #            * Author: Loïc Manceau
    #            * Reference: -
    #            * Institution: INRA
    #            * Abstract: -
    #- inputs:
    #            * name: gAI
    #                          ** description : Green Area Index of the day
    #                          ** inputtype : variable
    #                          ** variablecategory : auxiliary
    #                          ** datatype : DOUBLE
    #                          ** default : 0.0
    #                          ** min : 0.0
    #                          ** max : 500.0
    #                          ** unit : m2 leaf m-2 ground
    #                          ** uri : 
    #            * name: tTWindowForPTQ
    #                          ** description : Thermal Time window for average
    #                          ** inputtype : parameter
    #                          ** parametercategory : constant
    #                          ** datatype : DOUBLE
    #                          ** default : 0.0
    #                          ** min : 0.0
    #                          ** max : 5000.0
    #                          ** unit : °C d
    #                          ** uri : 
    #            * name: deltaTT
    #                          ** description : Thermal time increase of the day
    #                          ** inputtype : variable
    #                          ** variablecategory : auxiliary
    #                          ** datatype : DOUBLE
    #                          ** default : 0.0
    #                          ** min : 0.0
    #                          ** max : 100.0
    #                          ** unit : °C d
    #                          ** uri : 
    #            * name: pastMaxAI
    #                          ** description : Maximum Leaf Area Index reached the current day
    #                          ** inputtype : variable
    #                          ** variablecategory : state
    #                          ** datatype : DOUBLE
    #                          ** default : 0.0
    #                          ** min : 0.0
    #                          ** max : 5000.0
    #                          ** unit : m2 leaf m-2 ground
    #                          ** uri : 
    #            * name: listTTShootWindowForPTQ
    #                          ** description : List of daily shoot thermal time in the window dedicated to average
    #                          ** inputtype : variable
    #                          ** variablecategory : state
    #                          ** datatype : DOUBLELIST
    #                          ** default : [0.0]
    #                          ** min : 
    #                          ** max : 
    #                          ** unit : °C d
    #                          ** uri : 
    #            * name: listGAITTWindowForPTQ
    #                          ** description : List of daily Green Area Index in the window dedicated to average
    #                          ** inputtype : variable
    #                          ** variablecategory : state
    #                          ** datatype : DOUBLELIST
    #                          ** default : [0.0]
    #                          ** min : 
    #                          ** max : 
    #                          ** unit : m2 leaf m-2 ground
    #                          ** uri : 
    #- outputs:
    #            * name: gAImean
    #                          ** description : Mean Green Area Index
    #                          ** variablecategory : state
    #                          ** datatype : DOUBLE
    #                          ** min : 0.0
    #                          ** max : 500.0
    #                          ** unit : m2 leaf m-2 ground
    #                          ** uri : 
    #            * name: pastMaxAI
    #                          ** description : Maximum Leaf Area Index reached the current day
    #                          ** variablecategory : state
    #                          ** datatype : DOUBLE
    #                          ** min : 0.0
    #                          ** max : 5000.0
    #                          ** unit : m2 leaf m-2 ground
    #                          ** uri : 
    #            * name: listTTShootWindowForPTQ
    #                          ** description : List of daily shoot thermal time in the window dedicated to average
    #                          ** variablecategory : state
    #                          ** datatype : DOUBLELIST
    #                          ** min : 
    #                          ** max : 
    #                          ** unit : °C d
    #                          ** uri : 
    #            * name: listGAITTWindowForPTQ
    #                          ** description : List of daily Green Area Index in the window dedicated to average
    #                          ** variablecategory : state
    #                          ** datatype : DOUBLELIST
    #                          ** min : 
    #                          ** max : 
    #                          ** unit : m2 leaf m-2 ground
    #                          ** uri : 
    TTList = []
    GAIList = []
    count = 0
    gai_ = 0.0
    gaiMean_ = 0.0
    countGaiMean = 0
    for i in range(0 , len(listTTShootWindowForPTQ)):
        TTList.append(listTTShootWindowForPTQ[i])
        GAIList.append(listGAITTWindowForPTQ[i])
    TTList.append(deltaTT)
    GAIList.append(gAI)
    SumTT = sum(TTList)
    while SumTT > tTWindowForPTQ:
        SumTT = SumTT - TTList[count]
        count = count + 1
    listTTShootWindowForPTQ = []
    listGAITTWindowForPTQ = []
    for i in range(count , len(TTList)):
        listTTShootWindowForPTQ.append(TTList[i])
        listGAITTWindowForPTQ.append(GAIList[i])
    for i in range(0 , len(listGAITTWindowForPTQ)):
        gaiMean_ = gaiMean_ + listGAITTWindowForPTQ[i]
        countGaiMean = countGaiMean + 1
    gaiMean_ = gaiMean_ / countGaiMean
    gai_ = max(pastMaxAI, gaiMean_)
    pastMaxAI = gai_
    gAImean = gai_
    return (gAImean, pastMaxAI, listTTShootWindowForPTQ, listGAITTWindowForPTQ)