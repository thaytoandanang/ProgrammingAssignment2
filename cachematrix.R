## This module creates two function.
## 1. makeCacheMatrix
## 2. cacheSolve

## This function creates a special matrix called cached matrix, which is
## really a list containing a function to

## 1.  set the the matrix
## 2.  get the the matrix
## 3.  set the inverse of the matrix
## 4.  get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    
    inv <<- NULL
    
    set <- function(m) {
        x <<- m
        inv <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setinv <- function(invmatrix) {
        inv <<- invmatrix
    }
    
    getinv <- function() {
        inv
    }
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function creates the inverse of cached matrix
## If the inverse matrix is existing, get the cached inverse
## otherwise calculate the invere of cached matrix

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if (!is.null(inv)) {
        return(inv)
    }
    m <- x$get()
    inv <- solve(m)
    x$setinv(inv)
    inv
}
