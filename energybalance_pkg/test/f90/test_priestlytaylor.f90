!Test generation

PROGRAM test_test1_PriestlyTaylor 
    USE Priestlytaylormod
    REAL:: netRadiationEquivalentEvaporation

    REAL:: hslope

    REAL:: psychrometricConstant

    REAL:: Alpha

    REAL:: evapoTranspirationPriestlyTaylor

    Alpha = 1.5

    netRadiationEquivalentEvaporation = 638.142

    hslope = 0.584

    psychrometricConstant = 0.66

    call modelunit_priestlytaylor(netRadiationEquivalentEvaporation,hslope,psychrometricConstant,Alpha,evapoTranspirationPriestlyTaylor)
    print *,evapoTranspirationPriestlyTaylor
 END PROGRAM

