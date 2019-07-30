!Test generation

PROGRAM test_test1_SoilEvaporation 
    USE Soilevaporationmod
    REAL:: diffusionLimitedEvaporation

    REAL:: energyLimitedEvaporation

    REAL:: soilEvaporation

    diffusionLimitedEvaporation = 6605.505

    energyLimitedEvaporation = 448.240

    call modelunit_soilevaporation(diffusionLimitedEvaporation,energyLimitedEvaporation,soilEvaporation)
    print *,soilEvaporation
 END PROGRAM

