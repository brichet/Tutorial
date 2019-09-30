import numpy 
from math import *
def model_ptq(float tTWindowForPTQ=70.0,
              float kl=0.45,
              list listTTShootWindowForPTQ=[0.0],
              list listPARTTWindowForPTQ=[0.0],
              list listGAITTWindowForPTQ=[0.0],
              float pAR=0.0,
              float deltaTT=0.0):
    """

    Phyllochron Model
    Author: Pierre Martre
    Reference: Modeling development phase in the 
                Wheat Simulation Model SiriusQuality.
                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    Institution: INRA Montpellier
    Abstract: Calculate Photothermal Quaotient 

    """
    cdef float ptq
    cdef floatlist TTList
    cdef floatlist PARList
    cdef int i, count
    cdef float SumTT, parInt = 0.0, TTShoot;
    for i in range(0,len(listTTShootWindowForPTQ)):
        TTList.append(listTTShootWindowForPTQ[i])
        PARList.append(listPARTTWindowForPTQ[i])
    TTList.append(deltaTT)
    PARList.append(pAR)
    SumTT= sum(TTList)
    count=0
    while (SumTT > tTWindowForPTQ):
        SumTT -= TTList[count]
        count = count +1
    listTTShootWindowForPTQ=[]
    listPARTTWindowForPTQ=[]
    for i in range(count, len(TTList)):
        listTTShootWindowForPTQ.append(TTList[i])
        listPARTTWindowForPTQ.append(PARList[i])
    for i in range(0, len(listTTShootWindowForPTQ)): parInt = parInt + listPARTTWindowForPTQ[i] * (1 - exp(-kl * listGAITTWindowForPTQ[i]));
    TTShoot = sum(listTTShootWindowForPTQ)
    ptq = parInt / TTShoot
    return  listPARTTWindowForPTQ, listTTShootWindowForPTQ, ptq
