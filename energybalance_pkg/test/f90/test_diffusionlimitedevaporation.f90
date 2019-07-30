!Test generation

PROGRAM test_test1_DiffusionLimitedEvaporation 
    USE Diffusionlimitedevaporationmod
    REAL:: deficitOnTopLayers

    REAL:: soilDiffusionConstant

    REAL:: diffusionLimitedEvaporation

    soilDiffusionConstant = 4.2

    deficitOnTopLayers = 5341

    call modelunit_diffusionlimitedevaporation(deficitOnTopLayers,soilDiffusionConstant,diffusionLimitedEvaporation)
    print *,diffusionLimitedEvaporation
 END PROGRAM

