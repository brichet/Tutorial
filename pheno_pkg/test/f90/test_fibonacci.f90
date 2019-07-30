!Test generation

PROGRAM test_test1_fibonacci 
    USE Fibonaccimod
    INTEGER:: n

    INTEGER:: result

    n = 6

    call modelunit_fibonacci(n,result)
    print *,result
 END PROGRAM

