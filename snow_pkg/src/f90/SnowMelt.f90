MODULE Snowmeltmod
    IMPLICIT NONE
CONTAINS

    SUBROUTINE model_SnowMelt(ps, &
        M, &
        Snowmelt)
        IMPLICIT NONE
        REAL, INTENT(IN) :: ps
        REAL, INTENT(IN) :: M
        REAL, INTENT(OUT) :: Snowmelt
        !- Description:
    !            * Title: Snow Melt
    !            * Author: STICS
    !            * Reference: -
    !            * Institution: INRA
    !            * Abstract: -
        !- inputs:
    !            * name: ps
    !                          ** description : density of snow cover
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : kg/m**3
    !                          ** uri : 
    !            * name: M
    !                          ** description : snow in the process of melting
    !                          ** inputtype : variable
    !                          ** variablecategory : rate
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : mmW/d
    !                          ** uri : 
        !- outputs:
    !            * name: Snowmelt
    !                          ** description : Snow melt
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m
    !                          ** uri : 
        Snowmelt = 0.0
        IF(ps .GT. 1e-8) THEN
            Snowmelt = M / ps
        END IF
    END SUBROUTINE model_SnowMelt

END MODULE
