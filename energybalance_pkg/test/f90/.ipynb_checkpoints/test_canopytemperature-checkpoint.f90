!Test generation

PROGRAM test
    USE Canopytemperaturemod
    REAL:: minTair
    REAL:: maxTair
    REAL:: cropHeatFlux
    REAL:: conductance
    REAL:: lambdaV
    REAL:: rhoDensityAir
    REAL:: specificHeatCapacityAir
    REAL:: minCanopyTemperature
    REAL:: maxCanopyTemperature
    print *, "--------test_test1_CanopyTemperature-------"
    rhoDensityAir = 1.225
    minTair = 0.7
    maxTair = 7.2
    cropHeatFlux = 447.912
    conductance = 598.685
    lambdaV = 2.454
    specificHeatCapacityAir = 0.00101
    call model_canopytemperature(minTair, maxTair, cropHeatFlux,  &
            conductance, lambdaV, rhoDensityAir, specificHeatCapacityAir,  &
            minCanopyTemperature, maxCanopyTemperature)
    print *, minCanopyTemperature,maxCanopyTemperature

END PROGRAM