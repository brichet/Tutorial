!Test generation

PROGRAM test
    USE Soilheatfluxmod
    REAL:: netRadiationEquivalentEvaporation
    REAL:: tau
    REAL:: soilEvaporation
    REAL:: soilHeatFlux
    print *, "--------test_test1_SoilHeatFlux-------"
    tau = 0.9983
    netRadiationEquivalentEvaporation = 638.142
    soilEvaporation = 448.240
    call model_soilheatflux(netRadiationEquivalentEvaporation, tau,  &
            soilEvaporation, soilHeatFlux)
    print *, soilHeatFlux

END PROGRAM
