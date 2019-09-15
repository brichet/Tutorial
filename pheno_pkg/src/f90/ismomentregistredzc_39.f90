MODULE Ismomentregistredzc_39mod
    USE list_sub
    IMPLICIT NONE
CONTAINS
    SUBROUTINE model_ismomentregistredzc_39(calendarMoments, &
        isMomentRegistredZC_39)
        CHARACTER(65), ALLOCATABLE , DIMENSION(:), INTENT(IN) ::  &
                calendarMoments
        INTEGER, INTENT(OUT) :: isMomentRegistredZC_39
        !- Description:
    !            - Model Name: Is FlagLeafLiguleJustVisible Model
    !            - Author: Pierre Martre
    !            - Reference: Modeling development phase in the 
    !                Wheat Simulation Model SiriusQuality.
    !                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    !            - Institution: INRA Montpellier
    !            - Abstract: if FlagLeafLiguleJustVisible is already Registred 
        !- inputs:
    !            - name: calendarMoments
    !                          - description : List containing appearance of each stage
    !                          - variablecategory : state
    !                          - datatype : STRINGLIST
    !                          - default : ['Sowing']
    !                          - unit : 
    !                          - inputtype : variable
        !- outputs:
    !            - name: isMomentRegistredZC_39
    !                          - description :  if Flag leaf ligule has already appeared 
    !                          - variablecategory : state
    !                          - datatype : INT
    !                          - min : 0
    !                          - max : 1
    !                          - unit : 
        IF (ANY(calendarMoments .EQ. 'FlagLeafLiguleJustVisible')) THEN
            isMomentRegistredZC_39=1
        ELSE
            isMomentRegistredZC_39=0
        END IF
    END SUBROUTINE model_ismomentregistredzc_39

END MODULE
