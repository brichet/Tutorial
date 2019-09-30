MODULE Gaimeanmod
    USE list_sub
    IMPLICIT NONE
CONTAINS
    SUBROUTINE model_gaimean(gAI, &
        tTWindowForPTQ, &
        deltaTT, &
        pastMaxAI, &
        listTTShootWindowForPTQ, &
        listGAITTWindowForPTQ, &
        gAImean)
        REAL, INTENT(IN) :: gAI
        REAL, INTENT(IN) :: tTWindowForPTQ
        REAL, INTENT(IN) :: deltaTT
        REAL, INTENT(INOUT) :: pastMaxAI
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                listTTShootWindowForPTQ
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                listGAITTWindowForPTQ
        REAL, INTENT(OUT) :: gAImean
        REAL, ALLOCATABLE , DIMENSION(:):: TTList
        REAL, ALLOCATABLE , DIMENSION(:):: GAIList
        REAL:: SumTT
        INTEGER:: count = 0
        REAL:: gai_ = 0.0
        REAL:: gaiMean_ = 0.0
        INTEGER:: countGaiMean = 0
        INTEGER:: i
        !- Description:
    !            * Title: Average GAI on a specific thermal time window
    !            * Author: Loïc Manceau
    !            * Reference: -
    !            * Institution: INRA
    !            * Abstract: -
        !- inputs:
    !            * name: gAI
    !                          ** description : Green Area Index of the day
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: tTWindowForPTQ
    !                          ** description : Thermal Time window for average
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: deltaTT
    !                          ** description : Thermal time increase of the day
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: pastMaxAI
    !                          ** description : Maximum Leaf Area Index reached the current day
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: listTTShootWindowForPTQ
    !                          ** description : List of daily shoot thermal time in the window dedicated to average
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** default : [0.0]
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: listGAITTWindowForPTQ
    !                          ** description : List of daily Green Area Index in the window dedicated to average
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** default : [0.0]
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
        !- outputs:
    !            * name: gAImean
    !                          ** description : Mean Green Area Index
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: pastMaxAI
    !                          ** description : Maximum Leaf Area Index reached the current day
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: listTTShootWindowForPTQ
    !                          ** description : List of daily shoot thermal time in the window dedicated to average
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: listGAITTWindowForPTQ
    !                          ** description : List of daily Green Area Index in the window dedicated to average
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
        DO i = 1 , SIZE(listTTShootWindowForPTQ)
            call Add(TTList, listTTShootWindowForPTQ(i))
            call Add(GAIList, listGAITTWindowForPTQ(i))
        END DO
        call Add(TTList, deltaTT)
        call Add(GAIList, gAI)
        SumTT = sum(TTList)
        DO WHILE ( SumTT .GT. tTWindowForPTQ )
            SumTT = SumTT - TTList(count+1)
            count = count + 1
        END DO
        deallocate(listTTShootWindowForPTQ)

        deallocate(listGAITTWindowForPTQ)

        DO i = count + 1  , SIZE(TTList)
            call Add(listTTShootWindowForPTQ, TTList(i))
            call Add(listGAITTWindowForPTQ, GAIList(i))
        END DO
        DO i = 1 , SIZE(listGAITTWindowForPTQ)
            gaiMean_ = gaiMean_ + listGAITTWindowForPTQ(i)
            countGaiMean = countGaiMean + 1
        END DO
        gaiMean_ = gaiMean_ / countGaiMean
        gai_ = MAX(pastMaxAI, gaiMean_)
        pastMaxAI = gai_
        gAImean = gai_
    END SUBROUTINE model_gaimean

END MODULE
