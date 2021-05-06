MODULE Snowmod
    USE Meltingmod
    USE Refreezingmod
    USE Snowaccumulationmod
    USE Snowdensitymod
    USE Snowdepthmod
    USE Snowdepthtransmod
    USE Snowdrymod
    USE Snowmeltmod
    USE Snowwetmod
    USE Tavgmod
    USE Tempmaxmod
    USE Tempminmod
    USE Preciprecmod
    IMPLICIT NONE
CONTAINS

    SUBROUTINE model_Snow(jul, &
        tmaxseuil, &
        tminseuil, &
        prof, &
        tmin, &
        tmax, &
        precip, &
        Sdry_t1, &
        E, &
        rho, &
        Sdepth_t1, &
        Pns, &
        Swet_t1, &
        Kmin, &
        Tmf, &
        SWrf, &
        tsmax, &
        DKmax, &
        trmax, &
        ps_t1, &
        tmaxrec, &
        ps, &
        Mrf, &
        tavg, &
        Swet, &
        Snowmelt, &
        Snowaccu, &
        Sdry, &
        Sdepth, &
        tminrec, &
        M, &
        preciprec, &
        Sdepth_cm)
        IMPLICIT NONE
        INTEGER, INTENT(IN) :: jul
        REAL, INTENT(IN) :: tmaxseuil
        REAL, INTENT(IN) :: tminseuil
        REAL, INTENT(IN) :: prof
        REAL, INTENT(IN) :: tmin
        REAL, INTENT(IN) :: tmax
        REAL, INTENT(IN) :: precip
        REAL, INTENT(IN) :: Sdry_t1
        REAL, INTENT(IN) :: E
        REAL, INTENT(IN) :: rho
        REAL, INTENT(IN) :: Sdepth_t1
        REAL, INTENT(IN) :: Pns
        REAL, INTENT(IN) :: Swet_t1
        REAL, INTENT(IN) :: Kmin
        REAL, INTENT(IN) :: Tmf
        REAL, INTENT(IN) :: SWrf
        REAL, INTENT(IN) :: tsmax
        REAL, INTENT(IN) :: DKmax
        REAL, INTENT(IN) :: trmax
        REAL, INTENT(IN) :: ps_t1
        REAL, INTENT(OUT) :: tavg
        REAL, INTENT(OUT) :: M
        REAL, INTENT(OUT) :: Mrf
        REAL, INTENT(OUT) :: Snowaccu
        REAL, INTENT(OUT) :: ps
        REAL, INTENT(OUT) :: Snowmelt
        REAL, INTENT(OUT) :: Sdepth
        REAL, INTENT(OUT) :: Sdepth_cm
        REAL, INTENT(OUT) :: Sdry
        REAL, INTENT(OUT) :: Swet
        REAL, INTENT(OUT) :: tmaxrec
        REAL, INTENT(OUT) :: tminrec
        REAL, INTENT(OUT) :: preciprec
        !- Description:
    !            * Title: Snow model
    !            * Author: STICS
    !            * Reference: Snow paper
    !            * Institution: STICS
    !            * Abstract: Snow
        !- inputs:
    !            * name: jul
    !                          ** description : current day of year for the calculation
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : INT
    !                          ** default : 0
    !                          ** min : 0
    !                          ** max : 366
    !                          ** unit : d
    !                          ** uri : 
    !            * name: tmaxseuil
    !                          ** description : maximum temperature when snow cover is higher than prof
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: tminseuil
    !                          ** description : minimum temperature when snow cover is higher than prof
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: prof
    !                          ** description : snow cover threshold for snow insulation 
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000
    !                          ** unit : cm
    !                          ** uri : 
    !            * name: tmin
    !                          ** description : current minimum air temperature
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: tmax
    !                          ** description : current maximum air temperature
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: precip
    !                          ** description : current precipitation
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : mmW
    !                          ** uri : 
    !            * name: Sdry_t1
    !                          ** description : water in solid state in the snow cover in previous day
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW
    !                          ** uri : 
    !            * name: E
    !                          ** description : snow compaction parameter
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : mm/mm/d
    !                          ** uri : 
    !            * name: rho
    !                          ** description : The density of the new snow fixed by the user
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 100
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : kg/m**3
    !                          ** uri : 
    !            * name: Sdepth_t1
    !                          ** description : snow cover depth Calculation in previous day
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : m
    !                          ** uri : 
    !            * name: Pns
    !                          ** description : density of the new snow
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 100.0
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : cm/m
    !                          ** uri : 
    !            * name: Swet_t1
    !                          ** description : water in liquid state in the snow cover in previous day
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : mmW
    !                          ** uri : 
    !            * name: Kmin
    !                          ** description : minimum melting rate on 21 December
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : mmW/degC/d
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
    !            * name: tsmax
    !                          ** description : maximum daily air temperature (tmax) below which all precipitation is assumed to be snow
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: DKmax
    !                          ** description : difference between the maximum and the minimum melting rates
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : mmW/degC/d
    !                          ** uri : 
    !            * name: trmax
    !                          ** description : tmax above which all precipitation is assumed to be rain
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: ps_t1
    !                          ** description : density of snow cover in previous day
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : kg/m**3
    !                          ** uri : 
        !- outputs:
    !            * name: tmaxrec
    !                          ** description : recalculated maximum temperature
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: ps
    !                          ** description : density of snow cover
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : kg/m**3
    !                          ** uri : 
    !            * name: Mrf
    !                          ** description : liquid water in the snow cover in the process of refreezing
    !                          ** variablecategory : rate
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW/d
    !                          ** uri : 
    !            * name: tavg
    !                          ** description : mean temperature
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: Swet
    !                          ** description : water in liquid state in the snow cover
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW
    !                          ** uri : 
    !            * name: Snowmelt
    !                          ** description : Snow melt
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m
    !                          ** uri : 
    !            * name: Snowaccu
    !                          ** description : snowfall accumulation
    !                          ** variablecategory : rate
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW/d
    !                          ** uri : 
    !            * name: Sdry
    !                          ** description : water in solid state in the snow cover
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW
    !                          ** uri : 
    !            * name: Sdepth
    !                          ** description : snow cover depth Calculation
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m
    !                          ** uri : 
    !            * name: tminrec
    !                          ** description : recalculated minimum temperature
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : degC
    !                          ** uri : 
    !            * name: M
    !                          ** description : snow in the process of melting
    !                          ** variablecategory : rate
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW/d
    !                          ** uri : 
    !            * name: preciprec
    !                          ** description : precipitation recalculation
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : mmW
    !                          ** uri : 
    !            * name: Sdepth_cm
    !                          ** description : snow cover depth in cm
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : cm
    !                          ** uri : 
        call model_Tavg(tmin, tmax,tavg)
        call model_Refreezing(tavg, Tmf, SWrf,Mrf)
        call model_Melting(jul, Tmf, DKmax, Kmin, tavg,M)
        call model_SnowDensity(ps_t1, Sdepth_t1, Sdry_t1, Swet_t1,ps)
        call model_SnowMelt(ps, M,Snowmelt)
        call model_SnowAccumulation(tsmax, tmax, trmax, precip,Snowaccu)
        call model_SnowDry(Sdry_t1, Snowaccu, Mrf, M,Sdry)
        call model_SnowWet(Swet_t1, precip, Snowaccu, Mrf, M, Sdry,Swet)
        call model_SnowDepth(Snowmelt, Sdepth_t1, Snowaccu, E, rho,Sdepth)
        call model_Preciprec(Sdry_t1, Sdry, Swet, Swet_t1, Sdepth_t1, Sdepth,  &
                Mrf, precip, Snowaccu, rho,preciprec)
        call model_SnowDepthTrans(Sdepth, Pns,Sdepth_cm)
        call model_TempMax(Sdepth_cm, prof, tmax, tminseuil,  &
                tmaxseuil,tmaxrec)
        call model_TempMin(Sdepth_cm, prof, tmin, tminseuil,  &
                tmaxseuil,tminrec)
    END SUBROUTINE model_Snow

    SUBROUTINE init_Snow(jul, &
        tmaxseuil, &
        tminseuil, &
        prof, &
        tmin, &
        tmax, &
        precip, &
        E, &
        rho, &
        Pns, &
        Kmin, &
        Tmf, &
        SWrf, &
        tsmax, &
        DKmax, &
        trmax, &
        tmaxrec, &
        ps, &
        Mrf, &
        tavg, &
        Swet, &
        Snowmelt, &
        Snowaccu, &
        Sdry, &
        Sdepth, &
        tminrec, &
        M, &
        preciprec, &
        Sdepth_cm)
        IMPLICIT NONE
        INTEGER, INTENT(IN) :: jul
        REAL, INTENT(IN) :: tmaxseuil
        REAL, INTENT(IN) :: tminseuil
        REAL, INTENT(IN) :: prof
        REAL, INTENT(IN) :: tmin
        REAL, INTENT(IN) :: tmax
        REAL, INTENT(IN) :: precip
        REAL, INTENT(IN) :: E
        REAL, INTENT(IN) :: rho
        REAL, INTENT(IN) :: Pns
        REAL, INTENT(IN) :: Kmin
        REAL, INTENT(IN) :: Tmf
        REAL, INTENT(IN) :: SWrf
        REAL, INTENT(IN) :: tsmax
        REAL, INTENT(IN) :: DKmax
        REAL, INTENT(IN) :: trmax
        REAL, INTENT(OUT) :: tmaxrec
        REAL, INTENT(OUT) :: ps
        REAL, INTENT(OUT) :: Mrf
        REAL, INTENT(OUT) :: tavg
        REAL, INTENT(OUT) :: Swet
        REAL, INTENT(OUT) :: Snowmelt
        REAL, INTENT(OUT) :: Snowaccu
        REAL, INTENT(OUT) :: Sdry
        REAL, INTENT(OUT) :: Sdepth
        REAL, INTENT(OUT) :: tminrec
        REAL, INTENT(OUT) :: M
        REAL, INTENT(OUT) :: preciprec
        REAL, INTENT(OUT) :: Sdepth_cm
        tmaxrec = 0.0
        ps = 0.0
        Mrf = 0.0
        tavg = 0.0
        Swet = 0.0
        Snowmelt = 0.0
        Snowaccu = 0.0
        Sdry = 0.0
        Sdepth = 0.0
        tminrec = 0.0
        M = 0.0
        preciprec = 0.0
        Sdepth_cm = 0.0
        preciprec = precip
        tminrec = tmin
        tmaxrec = tmax
    END SUBROUTINE init_Snow

END MODULE
