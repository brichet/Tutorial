model_Melting <- function (jul = 0,
         Tmf = 0.5,
         DKmax = 0.0,
         Kmin = 0.0,
         tavg = 0.0){
    #'- Name: Melting -Version: 1.0, -Time step: 1
    #'- Description:
    #'            * Title: snow in the process of melting
    #'            * Author: STICS
    #'            * Reference: -
    #'            * Institution: INRA
    #'            * Abstract: -
    #'- inputs:
    #'            * name: jul
    #'                          ** description : current day of year for the calculation
    #'                          ** inputtype : variable
    #'                          ** variablecategory : auxiliary
    #'                          ** datatype : INT
    #'                          ** default : 0
    #'                          ** min : 0
    #'                          ** max : 366
    #'                          ** unit : d
    #'                          ** uri : 
    #'            * name: Tmf
    #'                          ** description : threshold temperature for snow melting 
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.5
    #'                          ** min : 0.0
    #'                          ** max : 1.0
    #'                          ** unit : degC
    #'                          ** uri : 
    #'            * name: DKmax
    #'                          ** description : difference between the maximum and the minimum melting rates
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 5000.0
    #'                          ** unit : mmW/degC/d
    #'                          ** uri : 
    #'            * name: Kmin
    #'                          ** description : minimum melting rate on 21 December
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 5000.0
    #'                          ** unit : mmW/degC/d
    #'                          ** uri : 
    #'            * name: tavg
    #'                          ** description : average temperature
    #'                          ** inputtype : variable
    #'                          ** variablecategory : auxiliary
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 100.0
    #'                          ** unit : degC
    #'                          ** uri : 
    #'- outputs:
    #'            * name: M
    #'                          ** description : snow in the process of melting
    #'                          ** variablecategory : rate
    #'                          ** datatype : DOUBLE
    #'                          ** min : 0.0
    #'                          ** max : 500.0
    #'                          ** unit : mmW/d
    #'                          ** uri : 
    M <- 0.0
    K <- DKmax / 2.0 * -sin((2.0 * pi * as.double(jul) / 366.0 + (9.0 / 16.0 * pi))) + Kmin + (DKmax / 2.0)
    if (tavg > Tmf)
    {
        M <- K * (tavg - Tmf)
    }
    return (list('M' = M))
}