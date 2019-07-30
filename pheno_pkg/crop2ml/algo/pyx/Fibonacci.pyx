def fibonacci(int n):
    cdef int result = 0
    cdef int b = 1
    cdef int i, temp
    for i in range(0 , n , 1):
        temp = result
        result = b
        b = temp + b
    return result
