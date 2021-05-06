MODULE Refreezingmod
    IMPLICIT NONE
CONTAINS

    SUBROUTINE model_Refreezing(tavg, &
        Tmf, &
        SWrf, &
        Mrf)
        IMPLICIT NONE
        REAL, INTENT(IN) :: tavg
        REAL, INTENT(IN) :: Tmf
        REAL, INTENT(IN) :: SWrf
        REAL, INTENT(OUT) :: Mrf
        !- Description:
    !            * Title: snowfall accumulation  calculation
    !            * Author: STICS
    !            * Reference: -
    !            * Institution: INRA
    !            * Abstract: -
        !- inputs:
    !            * name: tavg
    !                          ** description : average temperature
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: Tmf
    !                          ** description : threshold temperature for snow melting 
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: SWrf
    !                          ** description : degree-day temperature index for refreezing
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : mmW/degC/d
    !                          ** uri : 
        !- outputs:
    !            * name: Mrf
    !                          ** description : liquid water in the snow cover in the process of refreezing
    !                          ** variablecategory : rate
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW/d
    !                          ** uri : 
        Mrf = 0.0
        IF(tavg .LT. Tmf) THEN
            Mrf = SWrf * (Tmf - tavg)
        END IF
    END SUBROUTINE model_Refreezing

END MODULE
