!Test generation

PROGRAM test
    USE Evapotranspirationmod
    INTEGER:: isWindVpDefined
    REAL:: evapoTranspirationPriestlyTaylor
    REAL:: evapoTranspirationPenman
    REAL:: evapoTranspiration
    print *, "--------test_test1_EvapoTranspiration-------"
    isWindVpDefined = 1
    evapoTranspirationPriestlyTaylor = 449.367
    evapoTranspirationPenman = 830.957
    call model_evapotranspiration(isWindVpDefined,  &
            evapoTranspirationPriestlyTaylor, evapoTranspirationPenman,  &
            evapoTranspiration)
    print *, evapoTranspiration

END PROGRAM
