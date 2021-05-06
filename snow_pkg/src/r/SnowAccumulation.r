model_SnowAccumulation <- function (tsmax = 0.0,
         tmax = 0.0,
         trmax = 0.0,
         precip = 0.0){
    #'- Name: SnowAccumulation -Version: 1.0, -Time step: 1
    #'- Description:
    #'            * Title: snowfall accumulation  calculation
    #'            * Author: STICS
    #'            * Reference: -
    #'            * Institution: INRA
    #'            * Abstract: -
    #'- inputs:
    #'            * name: tsmax
    #'                          ** description : maximum daily air temperature (tmax) below which all precipitation is assumed to be snow
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 1000
    #'                          ** unit : degC
    #'                          ** uri : 
    #'            * name: tmax
    #'                          ** description : current maximum air temperature
    #'                          ** inputtype : variable
    #'                          ** variablecategory : auxiliary
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 5000.0
    #'                          ** unit : degC
    #'                          ** uri : 
    #'            * name: trmax
    #'                          ** description : tmax above which all precipitation is assumed to be rain
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 5000.0
    #'                          ** unit : degC
    #'                          ** uri : 
    #'            * name: precip
    #'                          ** description : recalculated precipitation
    #'                          ** inputtype : variable
    #'                          ** variablecategory : auxiliary
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 5000.0
    #'                          ** unit : mmW
    #'                          ** uri : 
    #'- outputs:
    #'            * name: Snowaccu
    #'                          ** description : snowfall accumulation
    #'                          ** variablecategory : rate
    #'                          ** datatype : DOUBLE
    #'                          ** min : 0.0
    #'                          ** max : 500.0
    #'                          ** unit : mmW/d
    #'                          ** uri : 
    fs <- 0.0
    if (tmax < tsmax)
    {
        fs <- 1.0
    }
    if (tmax >= tsmax && tmax <= trmax)
    {
        fs <- (trmax - tmax) / (trmax - tsmax)
    }
    Snowaccu <- fs * precip * 1
    return (list('Snowaccu' = Snowaccu))
}