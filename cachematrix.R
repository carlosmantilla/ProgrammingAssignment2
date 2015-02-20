# Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function should return a list of functions to set/get our matrix and 
## its "inverse". I see it like a soft of "mediator" for retriving and setting
## the costly inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) s <<- solve	## function to set and
        getinverse <- function() s			## get it "solve"
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## Write a short comment describing this function
## This function actually retrive the value of the inverse (if it exist,
## this is the first condition to evaluate... or solve the inverse (if it
## is not previously calculated)

cacheSolve <- function(x, ...) {
        
	## Return a matrix that is the inverse of 'x'

	s <- x$getinverse()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
	
	## calculate the inverse of 'x' if not previously calculated it
        
	data <- x$get()
        s <- solve(data)
        x$setinverse(s)
        s

}