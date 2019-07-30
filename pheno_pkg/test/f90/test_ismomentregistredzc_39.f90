!Test generation

PROGRAM test_test_wheat1_IsMomentRegistredZC_39 
    USE Ismomentregistredzc_39mod
    CHARACTER, ALLOCATABLE, DIMENSION(:):: calendarMoments

    INTEGER:: isMomentRegistredZC_39

    calendarMoments = ["Sowing", "Emergence", "FloralInitiation", "FlagLeafLiguleJustVisible", "Heading", "Anthesis"]

    call modelunit_ismomentregistredzc_39(calendarMoments,isMomentRegistredZC_39)
    print *,isMomentRegistredZC_39
 END PROGRAM

