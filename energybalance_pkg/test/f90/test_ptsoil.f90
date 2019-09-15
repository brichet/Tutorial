!Test generation

PROGRAM test
    USE Ptsoilmod
    REAL:: evapoTranspirationPriestlyTaylor
    REAL:: Alpha
    REAL:: tau
    REAL:: tauAlpha
    REAL:: energyLimitedEvaporation
    print *, "--------test_test1_PtSoil-------"
    tau = 0.9983
    evapoTranspirationPriestlyTaylor = 449.367
    Alpha = 1.5
    tauAlpha = 0.3
    call model_ptsoil(evapoTranspirationPriestlyTaylor, Alpha, tau,  &
            tauAlpha, energyLimitedEvaporation)
    print *, energyLimitedEvaporation

END PROGRAM
