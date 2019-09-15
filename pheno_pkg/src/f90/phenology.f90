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
    IMPLICIT NONE
CONTAINS
    SUBROUTINE model_phenology(leafNumber, &
        gai, &
        grainCumulTT, &
        cumulTT, &
        sLDL, &
        dayLength, &
        p, &
        finalLeafNumber, &
        choosePhyllUse, &
        pHEADANTH, &
        ignoreGrainMaturation, &
        maxDL, &
        degfm, &
        dgf, &
        dcd, &
        pFLLAnth, &
        isVernalizable, &
        phase, &
        hasLastPrimordiumAppeared, &
        deltaTT, &
        hasZadokStageChanged, &
        currentZadokStage, &
        der, &
        intTSFLN, &
        slopeTSFLN, &
        currentdate, &
        tillerNumber, &
        dse, &
        leafTillerNumberArray, &
        targetFertileShoot, &
        sowingDensity, &
        canopyShootNumber, &
        hasFlagLeafLiguleAppeared, &
        tilleringProfile, &
        calendarCumuls, &
        calendarMoments, &
        sDsa_nh, &
        sDws, &
        sowingDay, &
        phylPTQ1, &
        rp, &
        aPTQ, &
        pastMaxAI, &
        ptq, &
        pincr, &
        ldecr, &
        pdecr, &
        lincr, &
        calendarDates, &
        kl, &
        latitude, &
        sDsa_sh, &
        pNini, &
        aMXLFNO, &
        minFinalNumber, &
        maxTvern, &
        minDL, &
        vAI, &
        intTvern, &
        minTvern, &
        vernaprog, &
        vBEE, &
        averageShootNumberPerPlant, &
        phyllochron)
        REAL, INTENT(INOUT) :: leafNumber
        REAL, INTENT(IN) :: gai
        REAL, INTENT(IN) :: grainCumulTT
        REAL, INTENT(IN) :: cumulTT
        REAL, INTENT(IN) :: sLDL
        REAL, INTENT(IN) :: dayLength
        REAL, INTENT(IN) :: p
        REAL, INTENT(INOUT) :: finalLeafNumber
        CHARACTER(65), INTENT(IN) :: choosePhyllUse
        REAL, INTENT(IN) :: pHEADANTH
        LOGICAL, INTENT(IN) :: ignoreGrainMaturation
        REAL, INTENT(IN) :: maxDL
        REAL, INTENT(IN) :: degfm
        REAL, INTENT(IN) :: dgf
        REAL, INTENT(IN) :: dcd
        REAL, INTENT(IN) :: pFLLAnth
        INTEGER, INTENT(IN) :: isVernalizable
        REAL, INTENT(INOUT) :: phase
        INTEGER, INTENT(INOUT) :: hasLastPrimordiumAppeared
        REAL, INTENT(IN) :: deltaTT
        INTEGER, INTENT(INOUT) :: hasZadokStageChanged
        CHARACTER(65), INTENT(INOUT) :: currentZadokStage
        REAL, INTENT(IN) :: der
        REAL, INTENT(IN) :: intTSFLN
        REAL, INTENT(IN) :: slopeTSFLN
        CHARACTER(65), INTENT(IN) :: currentdate
        INTEGER, INTENT(INOUT) :: tillerNumber
        REAL, INTENT(IN) :: dse
        INTEGER, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                leafTillerNumberArray
        REAL, INTENT(IN) :: targetFertileShoot
        REAL, INTENT(IN) :: sowingDensity
        REAL, INTENT(INOUT) :: canopyShootNumber
        INTEGER, INTENT(INOUT) :: hasFlagLeafLiguleAppeared
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) :: tilleringProfile
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) :: calendarCumuls
        CHARACTER(65), ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                calendarMoments
        INTEGER, INTENT(IN) :: sDsa_nh
        INTEGER, INTENT(IN) :: sDws
        INTEGER, INTENT(IN) :: sowingDay
        REAL, INTENT(IN) :: phylPTQ1
        REAL, INTENT(IN) :: rp
        REAL, INTENT(IN) :: aPTQ
        REAL, INTENT(INOUT) :: pastMaxAI
        REAL, INTENT(IN) :: ptq
        REAL, INTENT(IN) :: pincr
        REAL, INTENT(IN) :: ldecr
        REAL, INTENT(IN) :: pdecr
        REAL, INTENT(IN) :: lincr
        CHARACTER(65), ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                calendarDates
        REAL, INTENT(IN) :: kl
        REAL, INTENT(IN) :: latitude
        INTEGER, INTENT(IN) :: sDsa_sh
        REAL, INTENT(IN) :: pNini
        REAL, INTENT(IN) :: aMXLFNO
        REAL, INTENT(INOUT) :: minFinalNumber
        REAL, INTENT(IN) :: maxTvern
        REAL, INTENT(IN) :: minDL
        REAL, INTENT(IN) :: vAI
        REAL, INTENT(IN) :: intTvern
        REAL, INTENT(IN) :: minTvern
        REAL, INTENT(INOUT) :: vernaprog
        REAL, INTENT(IN) :: vBEE
        REAL:: fixPhyll
        REAL, INTENT(OUT) :: phyllochron
        REAL, INTENT(OUT) :: averageShootNumberPerPlant
        REAL:: cumulTTFromZC_39
        INTEGER:: isMomentRegistredZC_39
        REAL:: cumulTTFromZC_91
        REAL:: cumulTTFromZC_65
        !- Description:
    !            - Model Name: Phenology
    !            - Author: Pierre MARTRE
    !            - Reference: Modeling development phase in the 
    !                Wheat Simulation Model SiriusQuality.
    !                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    !            - Institution: INRA/LEPSE
    !            - Abstract: see documentation
        !- inputs:
    !            - name: leafNumber
    !                          - description : Actual number of phytomers
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 25
    !                          - default : 0
    !                          - unit : leaf
    !                          - uri : some url
    !                          - inputtype : variable
    !            - name: gai
    !                          - description : used to calculate Terminal spikelet
    !                          - variablecategory : auxiliary
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 0.3255196285135
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: grainCumulTT
    !                          - description : cumulTT used for the grain developpment
    !                          - variablecategory : auxiliary
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 0
    !                          - unit : °C d
    !                          - inputtype : variable
    !            - name: cumulTT
    !                          - description : cumul thermal times at current date
    !                          - variablecategory : auxiliary
    !                          - datatype : DOUBLE
    !                          - min : -200
    !                          - max : 10000
    !                          - default : 354.582294511779
    !                          - unit : °C d
    !                          - inputtype : variable
    !            - name: sLDL
    !                          - description : Daylength response of leaf production
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1
    !                          - default : 0.85
    !                          - unit : leaf h-1
    !                          - inputtype : parameter
    !            - name: dayLength
    !                          - description : length of the day
    !                          - datatype : DOUBLE
    !                          - variablecategory : auxiliary
    !                          - min : 0
    !                          - max : 24
    !                          - unit : h
    !                          - default : 12.7433275303389
    !                          - inputtype : variable
    !            - name: p
    !                          - description : Phyllochron (Varietal parameter)
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1000
    !                          - default : 120
    !                          - unit : °C d leaf-1
    !                          - inputtype : parameter
    !            - name: finalLeafNumber
    !                          - description : final leaf number
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 25
    !                          - default : 0
    !                          - unit : leaf
    !                          - inputtype : variable
    !            - name: choosePhyllUse
    !                          - description : Switch to choose the type of phyllochron calculation to be used
    !                          - parametercategory : species
    !                          - datatype : STRING
    !                          - unit : 
    !                          - default : Default
    !                          - inputtype : parameter
    !            - name: pHEADANTH
    !                          - description : Number of phyllochron between heading and anthesiss
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1000
    !                          - default : 1
    !                          - unit : 
    !                          - inputtype : parameter
    !            - name: ignoreGrainMaturation
    !                          - description : true to ignore grain maturation
    !                          - parametercategory : species
    !                          - datatype : BOOLEAN
    !                          - default : FALSE
    !                          - unit : 
    !                          - inputtype : parameter
    !            - name: maxDL
    !                          - description : Saturating photoperiod above which final leaf number is not influenced by daylength
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 24
    !                          - default : 15
    !                          - unit : h
    !                          - inputtype : parameter
    !            - name: degfm
    !                          - description : Grain maturation duration (from physiological maturity to harvest ripeness)
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 50
    !                          - default : 0
    !                          - unit : °C d
    !                          - inputtype : parameter
    !            - name: dgf
    !                          - description : Grain filling duration (from anthesis to physiological maturity)
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 450
    !                          - unit : °C d
    !                          - inputtype : parameter
    !            - name: dcd
    !                          - description : Duration of the endosperm cell division phase
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 100
    !                          - unit : °C d
    !                          - inputtype : parameter
    !            - name: pFLLAnth
    !                          - description : Phyllochronic duration of the period between flag leaf ligule appearance and anthesis
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1000
    !                          - unit : 
    !                          - default : 2.22
    !                          - inputtype : parameter
    !            - name: isVernalizable
    !                          - description : true if the plant is vernalizable
    !                          - parametercategory : species
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - unit : 
    !                          - default : 1
    !                          - inputtype : parameter
    !            - name: phase
    !                          - description :  the name of the phase
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 7
    !                          - default : 1
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: hasLastPrimordiumAppeared
    !                          - description : if Last Primordium has Appeared
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - default : 0
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: deltaTT
    !                          - description : daily delta TT 
    !                          - variablecategory : auxiliary
    !                          - datatype : DOUBLE
    !                          - min : -20
    !                          - max : 100
    !                          - default : 23.5895677277199
    !                          - unit : °C d
    !                          - inputtype : variable
    !            - name: hasZadokStageChanged
    !                          - description : true if the zadok stage has changed this time step
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - default : 0
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : variable
    !            - name: currentZadokStage
    !                          - description : current zadok stage
    !                          - variablecategory : state
    !                          - datatype : STRING
    !                          - min : 
    !                          - max : 
    !                          - default : MainShootPlus1Tiller
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : variable
    !            - name: der
    !                          - description : Duration of the endosperm endoreduplication phase
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 300.0
    !                          - unit : °C d
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: intTSFLN
    !                          - description : used to calculate Terminal spikelet
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 0.9
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: slopeTSFLN
    !                          - description : used to calculate Terminal spikelet
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 0.9
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: currentdate
    !                          - description : current date
    !                          - variablecategory : auxiliary
    !                          - datatype : DATE
    !                          - min : 
    !                          - max : 
    !                          - default : 9/4/2007
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : variable
    !            - name: tillerNumber
    !                          - description :  Number of tiller which appears
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 1
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: dse
    !                          - description : Thermal time from sowing to emergence
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1000
    !                          - default : 105
    !                          - unit : °C d
    !                          - inputtype : parameter
    !            - name: leafTillerNumberArray
    !                          - description : store the number of tiller for each leaf layer
    !                          - variablecategory : state
    !                          - datatype : INTLIST
    !                          - unit : leaf
    !                          - default : [1]
    !                          - inputtype : variable
    !            - name: targetFertileShoot
    !                          - description : max value of shoot number for the canopy
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 280
    !                          - max : 1000
    !                          - default : 600.0
    !                          - unit : shoot
    !                          - inputtype : variable
    !            - name: sowingDensity
    !                          - description : number of plant /m²
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 500
    !                          - default : 288.0
    !                          - unit : plant m-2
    !                          - inputtype : parameter
    !            - name: canopyShootNumber
    !                          - description : shoot number for the whole canopy
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 288.0
    !                          - unit : shoot m-2
    !                          - inputtype : variable
    !            - name: hasFlagLeafLiguleAppeared
    !                          - description : true if flag leaf has appeared (leafnumber reached finalLeafNumber)
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - default : 1
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : variable
    !            - name: tilleringProfile
    !                          - description :  store the amount of new tiller created at each time a new tiller appears
    !                          - variablecategory : state
    !                          - datatype : DOUBLELIST
    !                          - default : [288.0]
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: calendarCumuls
    !                          - description : list containing for each stage occured its cumulated thermal times
    !                          - variablecategory : state
    !                          - datatype : DOUBLELIST
    !                          - default : [0.0]
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: calendarMoments
    !                          - description : List containing appearance of each stage
    !                          - variablecategory : state
    !                          - datatype : STRINGLIST
    !                          - default : ['Sowing']
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: sDsa_nh
    !                          - description : Sowing date at which Phyllochrone is maximum in northern hemispher
    !                          - parametercategory : species
    !                          - datatype : INT
    !                          - default : 1
    !                          - min : 1
    !                          - max : 365
    !                          - unit : d
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: sDws
    !                          - description : Sowing date at which Phyllochrone is minimum
    !                          - parametercategory : species
    !                          - datatype : INT
    !                          - default : 1
    !                          - min : 1
    !                          - max : 365
    !                          - unit : d
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: sowingDay
    !                          - description : Day of Year at sowing
    !                          - parametercategory : species
    !                          - datatype : INT
    !                          - min : 1
    !                          - max : 365
    !                          - default : 1
    !                          - unit : d
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: phylPTQ1
    !                          - description : Phyllochron at PTQ equal 1
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - default : 20
    !                          - min : 0
    !                          - max : 1000
    !                          - unit : °C d leaf-1
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: rp
    !                          - description : Rate of change of Phyllochrone with sowing date
    !                          - parametercategory : species
    !                          - inputtype : parameter
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 365
    !                          - default : 0
    !                          - unit : d-1
    !                          - uri : some url
    !            - name: aPTQ
    !                          - description : Slope to intercept ratio for Phyllochron  parametrization with PhotoThermal Quotient
    !                          - parametercategory : species
    !                          - inputtype : variable
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1000
    !                          - default : 0.842934
    !                          - unit : 
    !                          - uri : some url
    !            - name: pastMaxAI
    !                          - description : Past Maximum GAI
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 0
    !                          - unit : m2 m-2
    !                          - uri : some url
    !                          - inputtype : variable
    !            - name: ptq
    !                          - description : Photothermal quotient 
    !                          - parametercategory : species
    !                          - inputtype : parameter
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - default : 0
    !                          - unit : MJ °C-1 d-1 m-2)
    !                          - uri : some url
    !            - name: pincr
    !                          - description : Factor increasing the phyllochron for leaf number higher than Lincr
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - default : 1.5
    !                          - min : 0
    !                          - max : 10
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: ldecr
    !                          - description : Leaf number up to which the phyllochron is decreased by Pdecr
    !                          - parametercategory : species
    !                          - inputtype : parameter
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 30
    !                          - default : 10
    !                          - unit : leaf
    !                          - uri : some url
    !            - name: pdecr
    !                          - description : Factor decreasing the phyllochron for leaf number less than Ldecr
    !                          - parametercategory : species
    !                          - inputtype : parameter
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10
    !                          - default : 0.4
    !                          - unit : 
    !                          - uri : some url
    !            - name: lincr
    !                          - description : Leaf number above which the phyllochron is increased by Pincr
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 30
    !                          - default : 8
    !                          - unit : leaf
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: calendarDates
    !                          - description : List containing  the dates of the wheat developmental phases
    !                          - variablecategory : state
    !                          - datatype : DATELIST
    !                          - default : ['21/3/2007']
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: kl
    !                          - description : Exctinction Coefficient
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 50
    !                          - default : 0.45
    !                          - unit : 
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: latitude
    !                          - description : Latitude
    !                          - parametercategory : soil
    !                          - datatype : DOUBLE
    !                          - min : -90
    !                          - max : 90
    !                          - default : 0.0
    !                          - unit : °
    !                          - uri : some url
    !                          - inputtype : parameter
    !            - name: sDsa_sh
    !                          - description : Sowing date at which Phyllochrone is maximum in southern hemispher
    !                          - parametercategory : species
    !                          - inputtype : parameter
    !                          - datatype : INT
    !                          - min : 1
    !                          - max : 365
    !                          - default : 1
    !                          - unit : d
    !                          - uri : some url
    !            - name: pNini
    !                          - description : Number of primorida in the apex at emergence
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 24
    !                          - default : 4.0
    !                          - unit : primordia
    !                          - inputtype : parameter
    !            - name: aMXLFNO
    !                          - description : Absolute maximum leaf number
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 25
    !                          - default : 24.0
    !                          - unit : leaf
    !                          - inputtype : parameter
    !            - name: minFinalNumber
    !                          - description : minimum final leaf number
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 25
    !                          - default : 5.5
    !                          - unit : leaf
    !                          - inputtype : variable
    !                          - variablecategory : state
    !            - name: maxTvern
    !                          - description : Maximum temperature for vernalization to occur
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : -20
    !                          - max : 60
    !                          - default :  23.0
    !                          - unit : °C
    !                          - inputtype : parameter
    !            - name: minDL
    !                          - description : Threshold daylength below which it does influence vernalization rate
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 12
    !                          - max : 24
    !                          - default : 8.0
    !                          - unit : h
    !                          - inputtype : parameter
    !            - name: vAI
    !                          - description : Response of vernalization rate to temperature
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1
    !                          - default :  0.015
    !                          - unit : d-1 °C-1
    !                          - inputtype : parameter
    !            - name: intTvern
    !                          - description : Intermediate temperature for vernalization to occur
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : -20
    !                          - max : 60
    !                          - default :  11.0
    !                          - unit : °C
    !                          - inputtype : parameter
    !            - name: minTvern
    !                          - description : Minimum temperature for vernalization to occur
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : -20
    !                          - max : 60
    !                          - default : 0.0
    !                          - unit : °C
    !                          - inputtype : parameter
    !            - name: vernaprog
    !                          - description : progression on a 0  to 1 scale of the vernalization
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1
    !                          - default :  0.5517254187376879
    !                          - unit : 
    !                          - inputtype : variable
    !            - name: vBEE
    !                          - description : Vernalization rate at 0°C
    !                          - parametercategory : species
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1
    !                          - default : 0.01
    !                          - unit : d-1
    !                          - inputtype : parameter
        !- outputs:
    !            - name: phase
    !                          - description : the name of the phase
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 7
    !                          - unit : 
    !            - name: finalLeafNumber
    !                          - description : final leaf number
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 25
    !                          - unit : leaf
    !            - name: minFinalNumber
    !                          - description : minimum final leaf number
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - unit : leaf
    !            - name: averageShootNumberPerPlant
    !                          - description : average shoot number per plant in the canopy
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - unit : shoot m-2
    !            - name: leafTillerNumberArray
    !                          - description : store the number of tiller for each leaf layer
    !                          - variablecategory : state
    !                          - datatype : INTLIST
    !                          - unit : leaf
    !            - name: tilleringProfile
    !                          - description :  store the amount of new tiller created at each time a new tiller appears
    !                          - variablecategory : state
    !                          - datatype : DOUBLELIST
    !                          - unit : 
    !            - name: tillerNumber
    !                          - description :  store the amount of new tiller created at each time a new tiller appears
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 10000
    !                          - unit : 
    !            - name: leafNumber
    !                          - description : Actual number of phytomers
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - unit : leaf
    !                          - uri : some url
    !            - name: phyllochron
    !                          - description :  the rate of leaf appearance 
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 1000
    !                          - unit :  °C d leaf-1
    !            - name: vernaprog
    !                          - description : progression on a 0  to 1 scale of the vernalization
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - unit : 
    !            - name: calendarCumuls
    !                          - description :  list containing for each stage occured its cumulated thermal times
    !                          - variablecategory : state
    !                          - datatype : DOUBLELIST
    !                          - unit : °C d
    !            - name: calendarDates
    !                          - description :  List containing  the dates of the wheat developmental phases
    !                          - variablecategory : state
    !                          - datatype : DATELIST 
    !                          - unit : 
    !            - name: calendarMoments
    !                          - description :  List containing apparition of each stage
    !                          - variablecategory : state
    !                          - datatype : STRINGLIST
    !                          - unit : 
    !            - name: pastMaxAI
    !                          - description : Past maximum GAI
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - unit : m2 m-2
    !            - name: currentZadokStage
    !                          - description : current zadok stage
    !                          - variablecategory : state
    !                          - datatype : STRING
    !                          - unit :  
    !                          - uri : some url
    !            - name: hasZadokStageChanged
    !                          - description : true if the zadok stage has changed this time step
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - unit : 
    !                          - uri : some url
    !            - name: hasFlagLeafLiguleAppeared
    !                          - description : true if flag leaf has appeared (leafnumber reached finalLeafNumber)
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - unit : 
    !                          - uri : some url
    !            - name: canopyShootNumber
    !                          - description : shoot number for the whole canopy
    !                          - variablecategory : state
    !                          - datatype : DOUBLE
    !                          - min : 0
    !                          - max : 10000
    !                          - unit : shoot m-2
    !            - name: hasLastPrimordiumAppeared
    !                          - description : if Last Primordium has Appeared
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - unit : 
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
                pincr, ptq, gai, pastMaxAI, kl, aPTQ, phylPTQ1, p,  &
                choosePhyllUse,phyllochron)
        call model_updatephase(cumulTT, leafNumber, cumulTTFromZC_39,  &
                isMomentRegistredZC_39, gai, grainCumulTT, dayLength, vernaprog,  &
                minFinalNumber, fixPhyll, isVernalizable, dse, pFLLAnth, dcd, dgf,  &
                degfm, maxDL, sLDL, ignoreGrainMaturation, pHEADANTH, choosePhyllUse,  &
                p, phase, cumulTTFromZC_91, phyllochron, hasLastPrimordiumAppeared,  &
                finalLeafNumber)
        call model_leafnumber(deltaTT, phyllochron,  &
                hasFlagLeafLiguleAppeared, leafNumber, phase)
        call model_updateleafflag(cumulTT, leafNumber, calendarMoments,  &
                calendarDates, calendarCumuls, currentdate, finalLeafNumber,  &
                hasFlagLeafLiguleAppeared, phase)
        call model_registerzadok(cumulTT, phase, leafNumber, calendarMoments,  &
                calendarDates, calendarCumuls, cumulTTFromZC_65, currentdate, der,  &
                slopeTSFLN, intTSFLN, finalLeafNumber, currentZadokStage,  &
                hasZadokStageChanged)
        call model_updatecalendar(cumulTT, calendarMoments, calendarDates,  &
                calendarCumuls, currentdate, phase)
        call model_shootnumber(canopyShootNumber, leafNumber, sowingDensity,  &
                targetFertileShoot, tilleringProfile, leafTillerNumberArray,  &
                tillerNumber,averageShootNumberPerPlant)
    END SUBROUTINE model_phenology

END MODULE
