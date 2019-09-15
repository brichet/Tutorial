def fibonacci(int n):
    cdef int result 
    cdef int b
    cdef int i, temp
    result = 0
    b = 1
    for i in range(0 , n , 1):
        temp = result
        result = b
        b = temp + b
    return result
