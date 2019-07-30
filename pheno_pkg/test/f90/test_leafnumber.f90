!Test generation

PROGRAM test_test_wheat1_LeafNumber 
    USE Leafnumbermod
    REAL:: deltaTT

    REAL:: phyllochron

    INTEGER:: hasFlagLeafLiguleAppeared

    REAL:: leafNumber

    REAL:: phase

    leafNumber = 5.147163833893262

    phase = 3

    phyllochron = 91.2

    deltaTT = 23.5895677277199

    hasFlagLeafLiguleAppeared = 0

    call modelunit_leafnumber(deltaTT,phyllochron,hasFlagLeafLiguleAppeared,leafNumber,phase)
    print *,leafNumber
 END PROGRAM

