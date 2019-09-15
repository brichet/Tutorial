!Test generation

PROGRAM test
    USE Netradiationequivalentevaporationmod
    REAL:: lambdaV
    REAL:: netRadiation
    REAL:: netRadiationEquivalentEvaporation
    print *, "--------test_test1_NetRadiationEquivalentEvaporation-------"
    netRadiation = 1.566
    lambdaV = 2.454
    call model_netradiationequivalentevaporation(lambdaV, netRadiation,  &
            netRadiationEquivalentEvaporation)
    print *, netRadiationEquivalentEvaporation

END PROGRAM
