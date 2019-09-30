MODULE Phenologymod
    USE list_sub
    USE Phyllochronmod
    USE Phylsowingdatecorrectionmod
    USE Shootnumbermod
    USE Updateleafflagmod
    USE Updatephasemod
    USE Leafnumbermod
    USE Vernalizationprogressmod
    USE Ismomentregistredzc_39mod
    USE Cumulttfrommod
    USE Updatecalendarmod
    USE Registerzadokmod
    USE Ptqmod
    USE Gaimeanmod
    IMPLICIT NONE
CONTAINS
    SUBROUTINE model_phenology(leafNumber, &
        minFinalNumber, &
        aMXLFNO, &
        currentdate, &
        cumulTT, &
        pNini, &
        sDsa_sh, &
        latitude, &
        kl, &
        calendarDates, &
        calendarMoments, &
        lincr, &
        ldecr, &
        pincr, &
        ptq, &
        gAImean, &
        pTQhf, &
        B, &
        areaSL, &
        areaSS, &
        lARmin, &
        sowingDensity, &
        lARmax, &
        lNeff, &
        rp, &
        p, &
        pdecr, &
        maxTvern, &
        dayLength, &
        listTTShootWindowForPTQ, &
        deltaTT, &
        pastMaxAI, &
        tTWindowForPTQ, &
        listGAITTWindowForPTQ, &
        gAI, &
        pAR, &
        listPARTTWindowForPTQ, &
        vBEE, &
        calendarCumuls, &
        isVernalizable, &
        vernaprog, &
        minTvern, &
        intTvern, &
        vAI, &
        maxDL, &
        choosePhyllUse, &
        minDL, &
        hasLastPrimordiumAppeared, &
        phase, &
        pFLLAnth, &
        dcd, &
        dgf, &
        degfm, &
        ignoreGrainMaturation, &
        pHEADANTH, &
        finalLeafNumber, &
        sLDL, &
        grainCumulTT, &
        sowingDay, &
        hasZadokStageChanged, &
        currentZadokStage, &
        sowingDate, &
        sDws, &
        sDsa_nh, &
        hasFlagLeafLiguleAppeared, &
        der, &
        tilleringProfile, &
        targetFertileShoot, &
        leafTillerNumberArray, &
        dse, &
        tillerNumber, &
        slopeTSFLN, &
        intTSFLN, &
        canopyShootNumber, &
        phyllochron, &
        averageShootNumberPerPlant)
        REAL, INTENT(INOUT) :: leafNumber
        REAL, INTENT(INOUT) :: minFinalNumber
        REAL, INTENT(IN) :: aMXLFNO
        CHARACTER(65), INTENT(IN) :: currentdate
        REAL, INTENT(IN) :: cumulTT
        REAL, INTENT(IN) :: pNini
        INTEGER, INTENT(IN) :: sDsa_sh
        REAL, INTENT(IN) :: latitude
        REAL, INTENT(IN) :: kl
        CHARACTER(65), ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                calendarDates
        CHARACTER(65), ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                calendarMoments
        REAL, INTENT(IN) :: lincr
        REAL, INTENT(IN) :: ldecr
        REAL, INTENT(IN) :: pincr
        REAL, INTENT(INOUT) :: ptq
        REAL, INTENT(INOUT) :: gAImean
        REAL, INTENT(IN) :: pTQhf
        REAL, INTENT(IN) :: B
        REAL, INTENT(IN) :: areaSL
        REAL, INTENT(IN) :: areaSS
        REAL, INTENT(IN) :: lARmin
        REAL, INTENT(IN) :: sowingDensity
        REAL, INTENT(IN) :: lARmax
        REAL, INTENT(IN) :: lNeff
        REAL, INTENT(IN) :: rp
        REAL, INTENT(IN) :: p
        REAL, INTENT(IN) :: pdecr
        REAL, INTENT(IN) :: maxTvern
        REAL, INTENT(IN) :: dayLength
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                listTTShootWindowForPTQ
        REAL, INTENT(IN) :: deltaTT
        REAL, INTENT(IN) :: pastMaxAI
        REAL, INTENT(IN) :: tTWindowForPTQ
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                listGAITTWindowForPTQ
        REAL, INTENT(IN) :: gAI
        REAL, INTENT(IN) :: pAR
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                listPARTTWindowForPTQ
        REAL, INTENT(IN) :: vBEE
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) :: calendarCumuls
        INTEGER, INTENT(IN) :: isVernalizable
        REAL, INTENT(INOUT) :: vernaprog
        REAL, INTENT(IN) :: minTvern
        REAL, INTENT(IN) :: intTvern
        REAL, INTENT(IN) :: vAI
        REAL, INTENT(IN) :: maxDL
        CHARACTER(65), INTENT(IN) :: choosePhyllUse
        REAL, INTENT(IN) :: minDL
        INTEGER, INTENT(INOUT) :: hasLastPrimordiumAppeared
        REAL, INTENT(INOUT) :: phase
        REAL, INTENT(IN) :: pFLLAnth
        REAL, INTENT(IN) :: dcd
        REAL, INTENT(IN) :: dgf
        REAL, INTENT(IN) :: degfm
        LOGICAL, INTENT(IN) :: ignoreGrainMaturation
        REAL, INTENT(IN) :: pHEADANTH
        REAL, INTENT(INOUT) :: finalLeafNumber
        REAL, INTENT(IN) :: sLDL
        REAL, INTENT(IN) :: grainCumulTT
        INTEGER, INTENT(IN) :: sowingDay
        INTEGER, INTENT(INOUT) :: hasZadokStageChanged
        CHARACTER(65), INTENT(INOUT) :: currentZadokStage
        CHARACTER(65), INTENT(IN) :: sowingDate
        INTEGER, INTENT(IN) :: sDws
        INTEGER, INTENT(IN) :: sDsa_nh
        INTEGER, INTENT(INOUT) :: hasFlagLeafLiguleAppeared
        REAL, INTENT(IN) :: der
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) :: tilleringProfile
        REAL, INTENT(IN) :: targetFertileShoot
        INTEGER, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                leafTillerNumberArray
        REAL, INTENT(IN) :: dse
        INTEGER, INTENT(INOUT) :: tillerNumber
        REAL, INTENT(IN) :: slopeTSFLN
        REAL, INTENT(IN) :: intTSFLN
        REAL, INTENT(INOUT) :: canopyShootNumber
        REAL:: fixPhyll
        REAL, INTENT(OUT) :: phyllochron
        REAL, INTENT(OUT) :: averageShootNumberPerPlant
        REAL:: cumulTTFromZC_39
        INTEGER:: isMomentRegistredZC_39
        REAL:: cumulTTFromZC_91
        REAL:: cumulTTFromZC_65
        !- Description:
    !            * Title: Phenology
    !            * Author: Pierre MARTRE
    !            * Reference: Modeling development phase in the 
    !                Wheat Simulation Model SiriusQuality.
    !                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    !            * Institution: INRA/LEPSE
    !            * Abstract: see documentation
        !- inputs:
    !            * name: leafNumber
    !                          ** description : Actual number of phytomers
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 25.0
    !                          ** unit : leaf
    !                          ** uri : some url
    !            * name: minFinalNumber
    !                          ** description : minimum final leaf number
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 25
    !                          ** default : 5.5
    !                          ** unit : leaf
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !            * name: aMXLFNO
    !                          ** description : Absolute maximum leaf number
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 25
    !                          ** default : 24.0
    !                          ** unit : leaf
    !                          ** inputtype : parameter
    !            * name: currentdate
    !                          ** description : current date 
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DATE
    !                          ** default : 2007/3/27
    !                          ** inputtype : variable
    !                          ** unit : 
    !            * name: cumulTT
    !                          ** description : cumul thermal times at currentdate
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** min : -200
    !                          ** max : 10000
    !                          ** default : 112.330110409888
    !                          ** unit : °C d
    !                          ** inputtype : variable
    !            * name: pNini
    !                          ** description : Number of primorida in the apex at emergence
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 24
    !                          ** default : 4.0
    !                          ** unit : primordia
    !                          ** inputtype : parameter
    !            * name: sDsa_sh
    !                          ** description : Sowing date at which Phyllochrone is maximum in southern hemispher
    !                          ** parametercategory : species
    !                          ** inputtype : parameter
    !                          ** datatype : INT
    !                          ** min : 1
    !                          ** max : 365
    !                          ** default : 1
    !                          ** unit : d
    !                          ** uri : some url
    !            * name: latitude
    !                          ** description : Latitude
    !                          ** parametercategory : soil
    !                          ** datatype : DOUBLE
    !                          ** min : -90
    !                          ** max : 90
    !                          ** default : 0.0
    !                          ** unit : °
    !                          ** uri : some url
    !                          ** inputtype : parameter
    !            * name: kl
    !                          ** description : Exctinction Coefficient
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** default : 0.45
    !                          ** min : 0.0
    !                          ** max : 50.0
    !                          ** unit : -
    !                          ** uri : some url
    !            * name: calendarDates
    !                          ** description : List containing  the dates of the wheat developmental phases
    !                          ** variablecategory : state
    !                          ** datatype : DATELIST
    !                          ** default : ['2007/3/21']
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: calendarMoments
    !                          ** description : List containing appearance of each stage
    !                          ** variablecategory : state
    !                          ** datatype : STRINGLIST
    !                          ** default : ['Sowing']
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: lincr
    !                          ** description : Leaf number above which the phyllochron is increased by Pincr
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** default : 8.0
    !                          ** min : 0.0
    !                          ** max : 30.0
    !                          ** unit : leaf
    !                          ** uri : some url
    !            * name: ldecr
    !                          ** description : Leaf number up to which the phyllochron is decreased by Pdecr
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : leaf
    !                          ** uri : some url
    !            * name: pincr
    !                          ** description : Factor increasing the phyllochron for leaf number higher than Lincr
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** default : 1.5
    !                          ** min : 0.0
    !                          ** max : 10.0
    !                          ** unit : -
    !                          ** uri : some url
    !            * name: ptq
    !                          ** description : Photothermal quotient 
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 10000.0
    !                          ** unit : MJ °C-1 d-1 m-2)
    !                          ** uri : some url
    !            * name: gAImean
    !                          ** description : Green Area Index
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 10000.0
    !                          ** unit : m2 m-2
    !                          ** uri : some url
    !            * name: pTQhf
    !                          ** description : Slope to intercept ratio for Phyllochron  parametrization with PhotoThermal Quotient
    !                          ** inputtype : parameter
    !                          ** parametercategory : genotypic
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : °C d leaf-1
    !                          ** uri : some url
    !            * name: B
    !                          ** description : Phyllochron at PTQ equal 1
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** default : 20.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : °C d leaf-1
    !                          ** uri : some url
    !            * name: areaSL
    !                          ** description :  Area Leaf
    !                          ** inputtype : parameter
    !                          ** parametercategory : genotypic
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : cm2
    !                          ** uri : some url
    !            * name: areaSS
    !                          ** description : Area Sheath
    !                          ** inputtype : parameter
    !                          ** parametercategory : genotypic
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : cm2
    !                          ** uri : some url
    !            * name: lARmin
    !                          ** description : LAR minimum
    !                          ** inputtype : parameter
    !                          ** parametercategory : genotypic
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : leaf-1 °C
    !                          ** uri : some url
    !            * name: sowingDensity
    !                          ** description : Sowing Density
    !                          ** inputtype : parameter
    !                          ** parametercategory : genotypic
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : plant m-2
    !                          ** uri : some url
    !            * name: lARmax
    !                          ** description : LAR maximum
    !                          ** inputtype : parameter
    !                          ** parametercategory : genotypic
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : leaf-1 °C
    !                          ** uri : some url
    !            * name: lNeff
    !                          ** description : Leaf Number efficace
    !                          ** inputtype : parameter
    !                          ** parametercategory : genotypic
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : leaf
    !                          ** uri : some url
    !            * name: rp
    !                          ** description : Rate of change of Phyllochrone with sowing date
    !                          ** parametercategory : species
    !                          ** inputtype : parameter
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 365
    !                          ** default : 0
    !                          ** unit : d-1
    !                          ** uri : some url
    !            * name: p
    !                          ** description : Phyllochron (Varietal parameter)
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** default : 120.0
    !                          ** min : 0.0
    !                          ** max : 1000.0
    !                          ** unit : °C d leaf-1
    !                          ** uri : some url
    !            * name: pdecr
    !                          ** description : Factor decreasing the phyllochron for leaf number less than Ldecr
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** default : 0.4
    !                          ** min : 0.0
    !                          ** max : 10.0
    !                          ** unit : -
    !                          ** uri : some url
    !            * name: maxTvern
    !                          ** description : Maximum temperature for vernalization to occur
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : -20
    !                          ** max : 60
    !                          ** default :  23.0
    !                          ** unit : °C
    !                          ** inputtype : parameter
    !            * name: dayLength
    !                          ** description : day length
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 12.3037621834005
    !                          ** unit : mm2 m-2
    !                          ** inputtype : variable
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
    !            * name: pAR
    !                          ** description : Daily Photosyntetically Active Radiation
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 10000.0
    !                          ** unit : MJ m² d
    !                          ** uri : some url
    !                          ** inputtype : variable
    !            * name: listPARTTWindowForPTQ
    !                          ** description : List of Daily PAR during TTWindowForPTQ thermal time period
    !                          ** variablecategory : state
    !                          ** inputtype : variable
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** default : [0.0]
    !                          ** unit : MJ m2 d
    !                          ** uri : some url
    !            * name: vBEE
    !                          ** description : Vernalization rate at 0°C
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default : 0.01
    !                          ** unit : d-1
    !                          ** inputtype : parameter
    !            * name: calendarCumuls
    !                          ** description : list containing for each stage occured its cumulated thermal times
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** default : [0.0]
    !                          ** unit : °C d
    !                          ** inputtype : variable
    !            * name: isVernalizable
    !                          ** description : true if the plant is vernalizable
    !                          ** parametercategory : species
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default : 1
    !                          ** unit : 
    !                          ** inputtype : parameter
    !            * name: vernaprog
    !                          ** description : progression on a 0  to 1 scale of the vernalization
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default :  0.5517254187376879
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: minTvern
    !                          ** description : Minimum temperature for vernalization to occur
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : -20
    !                          ** max : 60
    !                          ** default : 0.0
    !                          ** unit : °C
    !                          ** inputtype : parameter
    !            * name: intTvern
    !                          ** description : Intermediate temperature for vernalization to occur
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : -20
    !                          ** max : 60
    !                          ** default :  11.0
    !                          ** unit : °C
    !                          ** inputtype : parameter
    !            * name: vAI
    !                          ** description : Response of vernalization rate to temperature
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default :  0.015
    !                          ** unit : d-1 °C-1
    !                          ** inputtype : parameter
    !            * name: maxDL
    !                          ** description : Saturating photoperiod above which final leaf number is not influenced by daylength
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 24
    !                          ** default : 15.0
    !                          ** unit : h
    !                          ** inputtype : parameter
    !            * name: choosePhyllUse
    !                          ** description : Switch to choose the type of phyllochron calculation to be used
    !                          ** inputtype : parameter
    !                          ** parametercategory : species
    !                          ** datatype : STRING
    !                          ** default : Default
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : -
    !                          ** uri : some url
    !            * name: minDL
    !                          ** description : Threshold daylength below which it does influence vernalization rate
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 12
    !                          ** max : 24
    !                          ** default : 8.0
    !                          ** unit : h
    !                          ** inputtype : parameter
    !            * name: hasLastPrimordiumAppeared
    !                          ** description : if Last Primordium has Appeared
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default : 0
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: phase
    !                          ** description :  the name of the phase
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 7
    !                          ** default : 1
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: pFLLAnth
    !                          ** description : Phyllochronic duration of the period between flag leaf ligule appearance and anthesis
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1000
    !                          ** unit : 
    !                          ** default : 2.22
    !                          ** inputtype : parameter
    !            * name: dcd
    !                          ** description : Duration of the endosperm cell division phase
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 100
    !                          ** unit : °C d
    !                          ** inputtype : parameter
    !            * name: dgf
    !                          ** description : Grain filling duration (from anthesis to physiological maturity)
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 450
    !                          ** unit : °C d
    !                          ** inputtype : parameter
    !            * name: degfm
    !                          ** description : Grain maturation duration (from physiological maturity to harvest ripeness)
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 50
    !                          ** default : 0
    !                          ** unit : °C d
    !                          ** inputtype : parameter
    !            * name: ignoreGrainMaturation
    !                          ** description : true to ignore grain maturation
    !                          ** parametercategory : species
    !                          ** datatype : BOOLEAN
    !                          ** default : FALSE
    !                          ** unit : 
    !                          ** inputtype : parameter
    !            * name: pHEADANTH
    !                          ** description : Number of phyllochron between heading and anthesiss
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1000
    !                          ** default : 1
    !                          ** unit : 
    !                          ** inputtype : parameter
    !            * name: finalLeafNumber
    !                          ** description : final leaf number
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 25
    !                          ** default : 0
    !                          ** unit : leaf
    !                          ** inputtype : variable
    !            * name: sLDL
    !                          ** description : Daylength response of leaf production
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default : 0.85
    !                          ** unit : leaf h-1
    !                          ** inputtype : parameter
    !            * name: grainCumulTT
    !                          ** description : cumulTT used for the grain developpment
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 0
    !                          ** unit : °C d
    !                          ** inputtype : variable
    !            * name: sowingDay
    !                          ** description : Day of Year at sowing
    !                          ** parametercategory : species
    !                          ** datatype : INT
    !                          ** min : 1
    !                          ** max : 365
    !                          ** default : 1
    !                          ** unit : d
    !                          ** uri : some url
    !                          ** inputtype : parameter
    !            * name: hasZadokStageChanged
    !                          ** description : true if the zadok stage has changed this time step
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default : 0
    !                          ** unit : 
    !                          ** uri : some url
    !                          ** inputtype : variable
    !            * name: currentZadokStage
    !                          ** description : current zadok stage
    !                          ** variablecategory : state
    !                          ** datatype : STRING
    !                          ** min : 
    !                          ** max : 
    !                          ** default : MainShootPlus1Tiller
    !                          ** unit : 
    !                          ** uri : some url
    !                          ** inputtype : variable
    !            * name: sowingDate
    !                          ** description :  Date of Sowing
    !                          ** parametercategory : constant
    !                          ** datatype : DATE
    !                          ** min : 
    !                          ** max : 
    !                          ** default : 2007/3/21
    !                          ** unit : 
    !                          ** inputtype : parameter
    !            * name: sDws
    !                          ** description : Sowing date at which Phyllochrone is minimum
    !                          ** parametercategory : species
    !                          ** datatype : INT
    !                          ** default : 1
    !                          ** min : 1
    !                          ** max : 365
    !                          ** unit : d
    !                          ** uri : some url
    !                          ** inputtype : parameter
    !            * name: sDsa_nh
    !                          ** description : Sowing date at which Phyllochrone is maximum in northern hemispher
    !                          ** parametercategory : species
    !                          ** datatype : INT
    !                          ** default : 1
    !                          ** min : 1
    !                          ** max : 365
    !                          ** unit : d
    !                          ** uri : some url
    !                          ** inputtype : parameter
    !            * name: hasFlagLeafLiguleAppeared
    !                          ** description : true if flag leaf has appeared (leafnumber reached finalLeafNumber)
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 1
    !                          ** default : 0
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: der
    !                          ** description : Duration of the endosperm endoreduplication phase
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 300.0
    !                          ** unit : °C d
    !                          ** uri : some url
    !                          ** inputtype : parameter
    !            * name: tilleringProfile
    !                          ** description :  store the amount of new tiller created at each time a new tiller appears
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** default : [288.0]
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: targetFertileShoot
    !                          ** description : max value of shoot number for the canopy
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 280
    !                          ** max : 1000
    !                          ** default : 600.0
    !                          ** unit : shoot
    !                          ** inputtype : variable
    !            * name: leafTillerNumberArray
    !                          ** description : store the number of tiller for each leaf layer
    !                          ** variablecategory : state
    !                          ** datatype : INTLIST
    !                          ** unit : leaf
    !                          ** default : [1]
    !                          ** inputtype : variable
    !            * name: dse
    !                          ** description : Thermal time from sowing to emergence
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1000
    !                          ** default : 105
    !                          ** unit : °C d
    !                          ** inputtype : parameter
    !            * name: tillerNumber
    !                          ** description :  Number of tiller which appears
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 1
    !                          ** unit : 
    !                          ** inputtype : variable
    !            * name: slopeTSFLN
    !                          ** description : used to calculate Terminal spikelet
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 0.9
    !                          ** unit : 
    !                          ** uri : some url
    !                          ** inputtype : parameter
    !            * name: intTSFLN
    !                          ** description : used to calculate Terminal spikelet
    !                          ** parametercategory : species
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 0.9
    !                          ** unit : 
    !                          ** uri : some url
    !                          ** inputtype : parameter
    !            * name: canopyShootNumber
    !                          ** description : shoot number for the whole canopy
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** default : 288.0
    !                          ** unit : shoot m-2
    !                          ** inputtype : variable
        !- outputs:
    !            * name: currentZadokStage
    !                          ** description : current zadok stage
    !                          ** variablecategory : state
    !                          ** datatype : STRING
    !                          ** unit :  
    !                          ** uri : some url
    !            * name: hasZadokStageChanged
    !                          ** description : true if the zadok stage has changed this time step
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 1
    !                          ** unit : 
    !                          ** uri : some url
    !            * name: hasFlagLeafLiguleAppeared
    !                          ** description : true if flag leaf has appeared (leafnumber reached finalLeafNumber)
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 1
    !                          ** unit : 
    !                          ** uri : some url
    !            * name: listPARTTWindowForPTQ
    !                          ** description :  List of Daily PAR during TTWindowForPTQ thermal time period
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : MJ m2 d
    !            * name: hasLastPrimordiumAppeared
    !                          ** description : if Last Primordium has Appeared
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 1
    !                          ** unit : 
    !            * name: listTTShootWindowForPTQ
    !                          ** description : List of Daily Shoot thermal time during TTWindowForPTQ thermal time period
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : °C d
    !            * name: ptq
    !                          ** description : Photothermal Quotient
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** unit : MJ °C-1 d m-2)
    !            * name: calendarMoments
    !                          ** description :  List containing apparition of each stage
    !                          ** variablecategory : state
    !                          ** datatype : STRINGLIST
    !                          ** unit : 
    !            * name: canopyShootNumber
    !                          ** description : shoot number for the whole canopy
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** unit : shoot m-2
    !            * name: calendarDates
    !                          ** description :  List containing  the dates of the wheat developmental phases
    !                          ** variablecategory : state
    !                          ** datatype : DATELIST 
    !                          ** unit : 
    !            * name: leafTillerNumberArray
    !                          ** description : store the number of tiller for each leaf layer
    !                          ** variablecategory : state
    !                          ** datatype : INTLIST
    !                          ** unit : leaf
    !            * name: vernaprog
    !                          ** description : progression on a 0  to 1 scale of the vernalization
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** unit : 
    !            * name: phyllochron
    !                          ** description :  the rate of leaf appearance 
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 1000
    !                          ** unit :  °C d leaf-1
    !                          ** uri : some url
    !            * name: leafNumber
    !                          ** description : Actual number of phytomers
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** unit : leaf
    !                          ** uri : some url
    !            * name: tillerNumber
    !                          ** description :  store the amount of new tiller created at each time a new tiller appears
    !                          ** variablecategory : state
    !                          ** datatype : INT
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** unit : 
    !            * name: tilleringProfile
    !                          ** description :  store the amount of new tiller created at each time a new tiller appears
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** unit : 
    !            * name: averageShootNumberPerPlant
    !                          ** description : average shoot number per plant in the canopy
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** unit : shoot m-2
    !            * name: minFinalNumber
    !                          ** description : minimum final leaf number
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 10000
    !                          ** unit : leaf
    !            * name: finalLeafNumber
    !                          ** description : final leaf number
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 25
    !                          ** unit : leaf
    !            * name: phase
    !                          ** description : the name of the phase
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0
    !                          ** max : 7
    !                          ** unit : 
    !            * name: listGAITTWindowForPTQ
    !                          ** description : List of daily Green Area Index in the window dedicated to average
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: calendarCumuls
    !                          ** description :  list containing for each stage occured its cumulated thermal times
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** unit : °C d
    !            * name: gAImean
    !                          ** description : Mean Green Area Index
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
        call model_gaimean(gAI, tTWindowForPTQ, deltaTT, pastMaxAI,  &
                listTTShootWindowForPTQ, listGAITTWindowForPTQ,gAImean)
        call model_ptq(tTWindowForPTQ, kl, listTTShootWindowForPTQ,  &
                listPARTTWindowForPTQ, listGAITTWindowForPTQ, pAR, deltaTT,ptq)
        call model_cumulttfrom(calendarMoments, calendarCumuls,  &
                cumulTT,cumulTTFromZC_65,cumulTTFromZC_39,cumulTTFromZC_91)
        call  &
                model_ismomentregistredzc_39(calendarMoments,isMomentRegistredZC_39)
        call model_vernalizationprogress(dayLength, deltaTT, cumulTT,  &
                leafNumber, calendarMoments, calendarDates, calendarCumuls, minTvern,  &
                intTvern, vAI, vBEE, minDL, maxDL, maxTvern, pNini, aMXLFNO,  &
                vernaprog, currentdate, isVernalizable, minFinalNumber)
        call model_phylsowingdatecorrection(sowingDay, latitude, sDsa_sh, rp,  &
                sDws, sDsa_nh, p,fixPhyll)
        call model_phyllochron(fixPhyll, leafNumber, lincr, ldecr, pdecr,  &
                pincr, ptq, gAImean, kl, pTQhf, B, p, choosePhyllUse, areaSL, areaSS,  &
                lARmin, lARmax, sowingDensity, lNeff,phyllochron)
        call model_updatephase(cumulTT, leafNumber, cumulTTFromZC_39,  &
                isMomentRegistredZC_39, gAI, grainCumulTT, dayLength, vernaprog,  &
                minFinalNumber, fixPhyll, isVernalizable, dse, pFLLAnth, dcd, dgf,  &
                degfm, maxDL, sLDL, ignoreGrainMaturation, pHEADANTH, choosePhyllUse,  &
                p, phase, cumulTTFromZC_91, phyllochron, hasLastPrimordiumAppeared,  &
                finalLeafNumber)
        call model_leafnumber(deltaTT, phyllochron,  &
                hasFlagLeafLiguleAppeared, leafNumber, phase)
        call model_shootnumber(canopyShootNumber, leafNumber, sowingDensity,  &
                targetFertileShoot, tilleringProfile, leafTillerNumberArray,  &
                tillerNumber,averageShootNumberPerPlant)
        call model_updateleafflag(cumulTT, leafNumber, calendarMoments,  &
                calendarDates, calendarCumuls, currentdate, finalLeafNumber,  &
                hasFlagLeafLiguleAppeared, phase)
        call model_registerzadok(cumulTT, phase, leafNumber, calendarMoments,  &
                calendarDates, calendarCumuls, cumulTTFromZC_65, currentdate, der,  &
                slopeTSFLN, intTSFLN, finalLeafNumber, currentZadokStage,  &
                hasZadokStageChanged, sowingDate)
        call model_updatecalendar(cumulTT, calendarMoments, calendarDates,  &
                calendarCumuls, currentdate, phase)
    END SUBROUTINE model_phenology

END MODULE
