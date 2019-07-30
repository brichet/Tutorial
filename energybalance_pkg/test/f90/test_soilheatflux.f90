!Test generation

PROGRAM test_test1_SoilHeatFlux 
    USE Soilheatfluxmod
    REAL:: netRadiationEquivalentEvaporation

    REAL:: tau

    REAL:: soilEvaporation

    REAL:: soilHeatFlux

    tau = 0.9983

    netRadiationEquivalentEvaporation = 638.142

    soilEvaporation = 448.240

    call modelunit_soilheatflux(netRadiationEquivalentEvaporation,tau,soilEvaporation,soilHeatFlux)
    print *,soilHeatFlux
 END PROGRAM

