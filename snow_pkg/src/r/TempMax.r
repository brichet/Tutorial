model_TempMax <- function (Sdepth_cm = 0.0,
         prof = 0.0,
         tmax = 0.0,
         tminseuil = 0.0,
         tmaxseuil = 0.0){
    #'- Name: TempMax -Version: 1.0, -Time step: 1
    #'- Description:
    #'            * Title: Maximum temperature  recalculation
    #'            * Author: STICS
    #'            * Reference: -
    #'            * Institution: INRA
    #'            * Abstract: -
    #'- inputs:
    #'            * name: Sdepth_cm
    #'                          ** description : snow depth
    #'                          ** inputtype : variable
    #'                          ** variablecategory : state
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 500.0
    #'                          ** unit : cm
    #'                          ** uri : 
    #'            * name: prof
    #'                          ** description : snow cover threshold for snow insulation 
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 1000
    #'                          ** unit : cm
    #'                          ** uri : 
    #'            * name: tmax
    #'                          ** description : current maximum air temperature
    #'                          ** inputtype : variable
    #'                          ** variablecategory : auxiliary
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 100.0
    #'                          ** unit : degC
    #'                          ** uri : 
    #'            * name: tminseuil
    #'                          ** description : minimum temperature when snow cover is higher than prof
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 0.0
    #'                          ** max : 5000.0
    #'                          ** unit : degC
    #'                          ** uri : 
    #'            * name: tmaxseuil
    #'                          ** description : maximum temperature when snow cover is higher than prof
    #'                          ** inputtype : parameter
    #'                          ** parametercategory : constant
    #'                          ** datatype : DOUBLE
    #'                          ** default : 0.0
    #'                          ** min : 
    #'                          ** max : 
    #'                          ** unit : degC
    #'                          ** uri : 
    #'- outputs:
    #'            * name: tmaxrec
    #'                          ** description : recalculated maximum temperature
    #'                          ** variablecategory : state
    #'                          ** datatype : DOUBLE
    #'                          ** min : 0.0
    #'                          ** max : 500.0
    #'                          ** unit : degC
    #'                          ** uri : 
    tmaxrec <- tmax
    if (Sdepth_cm > prof)
    {
        if (tmax < tminseuil)
        {
            tmaxrec <- tminseuil
        }
        else
        {
            if (tmax > tmaxseuil)
            {
                tmaxrec <- tmaxseuil
            }
        }
    }
    else
    {
        if (Sdepth_cm > 0.0)
        {
            if (tmax <= 0.0)
            {
                tmaxrec <- tmaxseuil - ((1 - (Sdepth_cm / prof)) * -tmax)
            }
            else
            {
                tmaxrec <- 0.0
            }
        }
    }
    return (list('tmaxrec' = tmaxrec))
}