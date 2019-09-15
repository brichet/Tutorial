!Test generation

PROGRAM test
    USE Cropheatfluxmod
    REAL:: netRadiationEquivalentEvaporation
    REAL:: soilHeatFlux
    REAL:: potentialTranspiration
    REAL:: cropHeatFlux
    print *, "--------test_test1_CropHeatFlux-------"
    netRadiationEquivalentEvaporation = 638.142
    soilHeatFlux = 188.817
    potentialTranspiration =  1.413
    call model_cropheatflux(netRadiationEquivalentEvaporation,  &
            soilHeatFlux, potentialTranspiration, cropHeatFlux)
    print *, cropHeatFlux

END PROGRAM
