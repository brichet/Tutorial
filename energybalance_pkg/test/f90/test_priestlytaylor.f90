!Test generation

PROGRAM test
    USE Priestlytaylormod
    REAL:: netRadiationEquivalentEvaporation
    REAL:: hslope
    REAL:: psychrometricConstant
    REAL:: Alpha
    REAL:: evapoTranspirationPriestlyTaylor
    print *, "--------test_test1_PriestlyTaylor-------"
    Alpha = 1.5
    netRadiationEquivalentEvaporation = 638.142
    hslope = 0.584
    psychrometricConstant = 0.66
    call model_priestlytaylor(netRadiationEquivalentEvaporation, hslope,  &
            psychrometricConstant, Alpha, evapoTranspirationPriestlyTaylor)
    print *, evapoTranspirationPriestlyTaylor

END PROGRAM
