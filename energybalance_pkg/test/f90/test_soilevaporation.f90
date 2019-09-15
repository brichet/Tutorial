!Test generation

PROGRAM test
    USE Soilevaporationmod
    REAL:: diffusionLimitedEvaporation
    REAL:: energyLimitedEvaporation
    REAL:: soilEvaporation
    print *, "--------test_test1_SoilEvaporation-------"
    diffusionLimitedEvaporation = 6605.505
    energyLimitedEvaporation = 448.240
    call model_soilevaporation(diffusionLimitedEvaporation,  &
            energyLimitedEvaporation, soilEvaporation)
    print *, soilEvaporation

END PROGRAM
