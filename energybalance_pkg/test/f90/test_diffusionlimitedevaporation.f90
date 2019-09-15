!Test generation

PROGRAM test
    USE Diffusionlimitedevaporationmod
    REAL:: deficitOnTopLayers
    REAL:: soilDiffusionConstant
    REAL:: diffusionLimitedEvaporation
    print *, "--------test_test1_DiffusionLimitedEvaporation-------"
    soilDiffusionConstant = 4.2
    deficitOnTopLayers = 5341
    call model_diffusionlimitedevaporation(deficitOnTopLayers,  &
            soilDiffusionConstant, diffusionLimitedEvaporation)
    print *, diffusionLimitedEvaporation

END PROGRAM
