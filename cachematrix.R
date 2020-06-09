## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## invM formed as a NULL value so that it can be called up
## set creates x and invM as variables outside of this envrionment

## the 

makeCacheMatrix <- function(x = matrix()) {
        
        invM <- NULL
        set <- function(y) {
                x <<- y
                invM <<- NULL
        }
        
        ## creating functions that call up 
        get <- function() x                             ## pulls up x
        setinvM <- function(solve) invM <<- solve       ## sets invM to call UP the 
                                                        ## solve function
        getinvM <- function() invM                      ## runs the solve function
        list(set = set, get = get,
             setinvM = setinvM,
             getinvM = getinvM)
        ## list generates these functions as the output of the function                         
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        invM <- x$getinvM()
        if(!is.null(invM)) {
                message("getting cached data")
                return(invM)
        }
        data <- x$get()
        invM <- solve(data, ...)
        x$setinvM(invM)
        invM

        
}
