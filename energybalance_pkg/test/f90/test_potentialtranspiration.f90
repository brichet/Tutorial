!Test generation

PROGRAM test
    USE Potentialtranspirationmod
    REAL:: evapoTranspiration
    REAL:: tau
    REAL:: potentialTranspiration
    print *, "--------test_test1_PotentialTranspiration-------"
    tau = 0.9983
    evapoTranspiration = 830.958
    call model_potentialtranspiration(evapoTranspiration, tau,  &
            potentialTranspiration)
    print *, potentialTranspiration

END PROGRAM
