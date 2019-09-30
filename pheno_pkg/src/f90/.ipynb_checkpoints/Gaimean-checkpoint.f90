MODULE list_sub
    IMPLICIT NONE
    TYPE container
        CLASS(*), ALLOCATABLE :: item
        CLASS(*), ALLOCATABLE :: items(:)
    END TYPE

    interface Add
        module procedure AddToListFloat
        module procedure AddToListInt
        module procedure AddToListChar
        module procedure AddToListArray
    end interface
CONTAINS

    FUNCTION indice(vectorElem, elem)
        CHARACTER(LEN=*), DIMENSION(:):: vectorElem
        INTEGER::iterator, indice
        CHARACTER(LEN=*):: elem
        DO iterator= 1, SIZE(vectorElem)
            IF(vectorElem(iterator)==elem) THEN
                indice = iterator
            END IF
        END DO
        RETURN
    END FUNCTION indice


    SUBROUTINE AddToListFloat(list, element)
        IMPLICIT NONE
        INTEGER :: i, isize
        REAL, INTENT(IN) :: element
        REAL, DIMENSION(:), ALLOCATABLE, INTENT(INOUT) :: list
        REAL, DIMENSION(:), ALLOCATABLE :: clist
        IF(ALLOCATED(list)) THEN
            isize = SIZE(list)
            ALLOCATE(clist(isize+1))
            DO i=1,isize
                clist(i) = list(i)
            END DO
            clist(isize+1) = element
            DEALLOCATE(list)
            CALL MOVE_ALLOC(clist, list)
        ELSE
            ALLOCATE(list(1))
            list(1) = element
        END IF
    END SUBROUTINE AddToListFloat

    SUBROUTINE AddToListInt(list, element)
        IMPLICIT NONE
        INTEGER :: i, isize
        INTEGER, INTENT(IN) :: element
        INTEGER, DIMENSION(:), ALLOCATABLE, INTENT(INOUT) :: list
        INTEGER, DIMENSION(:), ALLOCATABLE :: clist
        IF(ALLOCATED(list)) THEN
            isize = SIZE(list)
            ALLOCATE(clist(isize+1))
            DO i=1,isize
                clist(i) = list(i)
            END DO
            clist(isize+1) = element
            DEALLOCATE(list)
            CALL MOVE_ALLOC(clist, list)
        ELSE
            ALLOCATE(list(1))
            list(1) = element
        END IF
    END SUBROUTINE AddToListInt

    SUBROUTINE AddToListChar(list, element)
        IMPLICIT NONE
        INTEGER :: i, isize, l
        CHARACTER(LEN=*), INTENT(IN) :: element
        CHARACTER(LEN=*), DIMENSION(:), ALLOCATABLE, INTENT(INOUT) :: list
        CHARACTER(LEN=65), DIMENSION(:), ALLOCATABLE :: clist
        IF(ALLOCATED(list)) THEN
            isize = SIZE(list)
            ALLOCATE(clist(isize+1))
            DO i=1,isize
                clist(i) = list(i)
            END DO
            clist(isize+1) = element
            DEALLOCATE(list)
            CALL MOVE_ALLOC(clist, list)
        ELSE
            l=1
            ALLOCATE(list(l))
            list(l) = element
        END IF
    END SUBROUTINE AddToListChar


    SUBROUTINE AddToListArray(a, e)
        TYPE(container),ALLOCATABLE,INTENT(INOUT) :: a(:)
        CLASS(*),INTENT(IN), allocatable :: e(:)
        TYPE(container),ALLOCATABLE :: tmp(:)

        IF (.NOT.ALLOCATED(a)) THEN
            ALLOCATE(a(1))
            ALLOCATE(a(1)%items(SIZE(e)), source = e)
        ELSE
            CALL MOVE_ALLOC(a,tmp)
            ALLOCATE(a(SIZE(tmp)+1))
            a(1:SIZE(tmp)) = tmp
            ALLOCATE(a(SIZE(tmp)+1)%items(SIZE(e)), source = e)
        END IF
    END SUBROUTINE AddToListArray

END MODULE list_sub
MODULE Gaimeanmod
    USE list_sub
    IMPLICIT NONE
CONTAINS
    SUBROUTINE model_gaimean(gAI, &
        tTWindowForPTQ, &
        deltaTT, &
        pastMaxAI, &
        listTTShootWindowForPTQ, &
        listGAITTWindowForPTQ, &
        gAImean)
        REAL, INTENT(IN) :: gAI
        REAL, INTENT(IN) :: tTWindowForPTQ
        REAL, INTENT(IN) :: deltaTT
        REAL, INTENT(INOUT) :: pastMaxAI
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                listTTShootWindowForPTQ
        REAL, ALLOCATABLE , DIMENSION(:), INTENT(INOUT) ::  &
                listGAITTWindowForPTQ
        REAL, INTENT(OUT) :: gAImean
        REAL, ALLOCATABLE , DIMENSION(:):: TTList
        REAL, ALLOCATABLE , DIMENSION(:):: GAIList
        REAL:: SumTT
        INTEGER:: count = 0
        REAL:: gai_ = 0.0
        REAL:: gaiMean_ = 0.0
        INTEGER:: countGaiMean = 0
        INTEGER:: i
        !- Description:
    !            * Title: Average GAI on a specific thermal time window
    !            * Author: Loïc Manceau
    !            * Reference: -
    !            * Institution: INRA
    !            * Abstract: -
        !- inputs:
    !            * name: gAI
    !                          ** description : Green Area Index of the day
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: tTWindowForPTQ
    !                          ** description : Thermal Time window for average
    !                          ** inputtype : parameter
    !                          ** parametercategory : constant
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: deltaTT
    !                          ** description : Thermal time increase of the day
    !                          ** inputtype : variable
    !                          ** variablecategory : auxiliary
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 100.0
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: pastMaxAI
    !                          ** description : Maximum Leaf Area Index reached the current day
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** default : 0.0
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: listTTShootWindowForPTQ
    !                          ** description : List of daily shoot thermal time in the window dedicated to average
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** default : [0.0]
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: listGAITTWindowForPTQ
    !                          ** description : List of daily Green Area Index in the window dedicated to average
    !                          ** inputtype : variable
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** default : [0.0]
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
        !- outputs:
    !            * name: gAImean
    !                          ** description : Mean Green Area Index
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 500.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: pastMaxAI
    !                          ** description : Maximum Leaf Area Index reached the current day
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLE
    !                          ** min : 0.0
    !                          ** max : 5000.0
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
    !            * name: listTTShootWindowForPTQ
    !                          ** description : List of daily shoot thermal time in the window dedicated to average
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : °C d
    !                          ** uri : 
    !            * name: listGAITTWindowForPTQ
    !                          ** description : List of daily Green Area Index in the window dedicated to average
    !                          ** variablecategory : state
    !                          ** datatype : DOUBLELIST
    !                          ** min : 
    !                          ** max : 
    !                          ** unit : m2 leaf m-2 ground
    !                          ** uri : 
        DO i = 1 , SIZE(listTTShootWindowForPTQ)
            call Add(TTList, listTTShootWindowForPTQ(i))
            call Add(GAIList, listGAITTWindowForPTQ(i))
        END DO
        call Add(TTList, deltaTT)
        call Add(GAIList, gAI)
        SumTT = sum(TTList)
        DO WHILE ( SumTT .GT. tTWindowForPTQ )
            SumTT = SumTT - TTList(count+1)
            count = count + 1
        END DO
        
        allocate(listTTShootWindowForPTQ(0))
        !listTTShootWindowForPTQ = [listTTShootWindowForPTQ,1]
        
        allocate(listGAITTWindowForPTQ(0))
        !listGAITTWindowForPTQ = [listGAITTWindowForPTQ,1]
        
        DO i = count + 1  , SIZE(TTList)
            call Add(listTTShootWindowForPTQ, TTList(i))
            call Add(listGAITTWindowForPTQ, GAIList(i))
        END DO
        DO i = 1 , SIZE(listGAITTWindowForPTQ)
            gaiMean_ = gaiMean_ + listGAITTWindowForPTQ(i)
            countGaiMean = countGaiMean + 1
        END DO
        gaiMean_ = gaiMean_ / countGaiMean
        gai_ = MAX(pastMaxAI, gaiMean_)
        pastMaxAI = gai_
        gAImean = gai_
    END SUBROUTINE model_gaimean

END MODULE
PROGRAM test
    USE Gaimeanmod
    REAL:: gAI
    REAL:: tTWindowForPTQ
    REAL:: deltaTT
    REAL:: pastMaxAI
    REAL, ALLOCATABLE, DIMENSION(:):: listTTShootWindowForPTQ
    REAL, ALLOCATABLE, DIMENSION(:):: listGAITTWindowForPTQ
    REAL:: gAImean
    print *, "--------test_test_wheat1_GAImean-------"
    tTWindowForPTQ = 70.0
    gAI = 91.2
    deltaTT = 0.279
    pastMaxAI = 0.279
    listTTShootWindowForPTQ = [0.0]
    listGAITTWindowForPTQ = [0.0]
    call model_gaimean(gAI, tTWindowForPTQ, deltaTT, pastMaxAI,  &
            listTTShootWindowForPTQ, listGAITTWindowForPTQ, gAImean)
    !gAImean: 45.6
    print *, "gAImean estimated :"
    print *, gAImean
    !pastMaxAI: 45.6
    print *, "pastMaxAI estimated :"
    print *, pastMaxAI
    !listTTShootWindowForPTQ: [0.0, 0.28]
    print *, "listTTShootWindowForPTQ estimated :"
    Do i_cyml = 1, 2
        print *, listTTShootWindowForPTQ(i_cyml);
    END DO
    !listGAITTWindowForPTQ: [0.0, 91.2]
    print *, "listGAITTWindowForPTQ estimated :"
    Do i_cyml = 1, 2
        print *, listGAITTWindowForPTQ(i_cyml);
    END DO

END PROGRAM
