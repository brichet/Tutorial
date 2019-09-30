import numpy 
from math import *
def model_gaimean(float gAI=0.0,
                  float tTWindowForPTQ=0.0,
                  float deltaTT=0.0,
                  float pastMaxAI=0.0,
                  list listTTShootWindowForPTQ=[0.0],
                  list listGAITTWindowForPTQ=[0.0]):
    """

    Average GAI on a specific thermal time window
    Author: Loïc Manceau
    Reference: -
    Institution: INRA
    Abstract: -

    """
    cdef float gAImean
        #- Description:
        #            - Model Name: Average GAI on a specific thermal time window
        #            - Author: Loic Manceau
        #            - Reference: -
        #            - Institution: INRA
        #            - Abstract: -
        #- inputs:
        #            - name: GAI
        #                          - description : Green Area Index of the day
        #                          - inputtype : variable
        #                          - variablecategory : state
        #                          - datatype : DOUBLE
        #                          - default : 0.0
        #                          - min : 0.0
        #                          - max : 500.0
        #                          - unit : m2 leaf m-2 ground
        #                          - uri : 
        #            - name: TTWindowForPTQ
        #                          - description : Thermal Time window for average
        #                          - inputtype : parameter
        #                          - parametercategory : constant
        #                          - datatype : DOUBLE
        #                          - default : 0.0
        #                          - min : 0.0
        #                          - max : 5000.0
        #                          - unit : Â°C d
        #                          - uri : 
        #            - name: DeltaTT
        #                          - description : Thermal time increase of the day
        #                          - inputtype : variable
        #                          - variablecategory : state
        #                          - datatype : DOUBLE
        #                          - default : 0.0
        #                          - min : 0.0
        #                          - max : 100.0
        #                          - unit : Â°C d
        #                          - uri : 
        #            - name: pastMaxAI
        #                          - description : Maximum Leaf Area Index reached the current day
        #                          - inputtype : variable
        #                          - variablecategory : state
        #                          - datatype : DOUBLE
        #                          - default : 0.0
        #                          - min : 0.0
        #                          - max : 5000.0
        #                          - unit : m2 leaf m-2 ground
        #                          - uri : 
        #            - name: ListTTShootWindowForPTQ
        #                          - description : List of daily shoot thermal time in the window dedicated to average
        #                          - inputtype : variable
        #                          - variablecategory : state
        #                          - datatype : DOUBLELIST
        #                          - default : [0.0]
        #                          - min : 
        #                          - max : 
        #                          - unit : Â°C d
        #                          - uri : 
        #            - name: ListGAITTWindowForPTQ
        #                          - description : List of daily Green Area Index in the window dedicated to average
        #                          - inputtype : variable
        #                          - variablecategory : state
        #                          - datatype : DOUBLELIST
        #                          - default : [0.0]
        #                          - min : 
        #                          - max : 
        #                          - unit : m2 leaf m-2 ground
        #                          - uri : 
        #- outputs:
        #            - name: GAImean
        #                          - description : Mean Green Area Index
        #                          - variablecategory : state
        #                          - datatype : DOUBLE
        #                          - min : 0.0
        #                          - max : 500.0
        #                          - unit : m2 leaf m-2 ground
        #                          - uri : 
        #            - name: pastMaxAI
        #                          - description : Maximum Leaf Area Index reached the current day
        #                          - variablecategory : state
        #                          - datatype : DOUBLE
        #                          - min : 0.0
        #                          - max : 5000.0
        #                          - unit : m2 leaf m-2 ground
        #                          - uri : 
        #            - name: ListTTShootWindowForPTQ
        #                          - description : List of daily shoot thermal time in the window dedicated to average
        #                          - variablecategory : state
        #                          - datatype : DOUBLELIST
        #                          - min : 
        #                          - max : 
        #                          - unit : Â°C d
        #                          - uri : 
        #            - name: ListGAITTWindowForPTQ
        #                          - description : List of daily Green Area Index in the window dedicated to average
        #                          - variablecategory : state
        #                          - datatype : DOUBLELIST
        #                          - min : 
        #                          - max : 
        #                          - unit : m2 leaf m-2 ground
        #                          - uri : 
    cdef floatlist TTList
    cdef floatlist GAIList
    cdef float SumTT
    cdef int count=0
    cdef float gai_=0.0
    cdef float gaiMean_=0.0
    cdef int countGaiMean=0
    cdef int i
    for i in range(0,len(listTTShootWindowForPTQ)):
        TTList.append(listTTShootWindowForPTQ[i])
        GAIList.append(listGAITTWindowForPTQ[i])
    TTList.append(deltaTT);
    GAIList.append(gAI);
    SumTT=sum(TTList)
    while (SumTT > tTWindowForPTQ):
        SumTT -=TTList[count]
        count=count+1
    listTTShootWindowForPTQ = [];
    listGAITTWindowForPTQ = [];
    for i in range(count,len(TTList)):
        listTTShootWindowForPTQ.append(TTList[i])
        listGAITTWindowForPTQ.append(GAIList[i])
    for i in range(0,len(listGAITTWindowForPTQ)):
        gaiMean_=gaiMean_+listGAITTWindowForPTQ[i]
        countGaiMean=countGaiMean+1
    gaiMean_=gaiMean_/countGaiMean               
    gai_=max(pastMaxAI, gaiMean_)
    pastMaxAI = gai_
    gAImean = gai_
    return  gAImean, pastMaxAI, listTTShootWindowForPTQ, listGAITTWindowForPTQ