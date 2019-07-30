!Test generation

PROGRAM test_test1_NetRadiationEquivalentEvaporation 
    USE Netradiationequivalentevaporationmod
    REAL:: lambdaV

    REAL:: netRadiation

    REAL:: netRadiationEquivalentEvaporation

    netRadiation = 1.566

    lambdaV = 2.454

    call modelunit_netradiationequivalentevaporation(lambdaV,netRadiation,netRadiationEquivalentEvaporation)
    print *,netRadiationEquivalentEvaporation
 END PROGRAM

