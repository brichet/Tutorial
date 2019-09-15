!Test generation

PROGRAM test
    USE Netradiationmod
    REAL:: minTair
    REAL:: maxTair
    REAL:: albedoCoefficient
    REAL:: stefanBoltzman
    REAL:: elevation
    REAL:: solarRadiation
    REAL:: vaporPressure
    REAL:: extraSolarRadiation
    REAL:: netRadiation
    REAL:: netOutGoingLongWaveRadiation
    print *, "--------test_test1_NetRadiation-------"
    elevation = 0
    solarRadiation = 3
    vaporPressure = 6.1
    minTair = 0.7
    maxTair = 7.2
    albedoCoefficient = 0.23
    stefanBoltzman = 4.903E-09
    extraSolarRadiation = 11.7
    call model_netradiation(minTair, maxTair, albedoCoefficient,  &
            stefanBoltzman, elevation, solarRadiation, vaporPressure,  &
            extraSolarRadiation, netRadiation, netOutGoingLongWaveRadiation)
    print *, netRadiation,netOutGoingLongWaveRadiation

END PROGRAM
