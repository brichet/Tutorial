!Test generation

PROGRAM test
    USE Penmanmod
    REAL:: evapoTranspirationPriestlyTaylor
    REAL:: hslope
    REAL:: VPDair
    REAL:: psychrometricConstant
    REAL:: Alpha
    REAL:: lambdaV
    REAL:: rhoDensityAir
    REAL:: specificHeatCapacityAir
    REAL:: conductance
    REAL:: evapoTranspirationPenman
    print *, "--------test_test1_Penman-------"
    Alpha = 1.5
    lambdaV = 2.454
    evapoTranspirationPriestlyTaylor = 449.367
    hslope = 0.584
    VPDair = 2.19
    psychrometricConstant = 0.66
    rhoDensityAir = 1.225
    specificHeatCapacityAir = 0.00101
    conductance = 598.685
    call model_penman(evapoTranspirationPriestlyTaylor, hslope, VPDair,  &
            psychrometricConstant, Alpha, lambdaV, rhoDensityAir,  &
            specificHeatCapacityAir, conductance, evapoTranspirationPenman)
    print *, evapoTranspirationPenman

END PROGRAM
