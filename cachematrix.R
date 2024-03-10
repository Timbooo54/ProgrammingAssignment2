## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix creates a special matrix object whose inverse matrix can be cached
makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
 set <- function(y) {
     x <<- y
    inv <<- NULL
 }
 get <- function() x
 setInverse <- function(inverse) inv <<- inverse
 getInverse <- function() inv
 list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
## cacheSolve retrieves the inverse from the cache or computes the inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 inv <- x$getInverse()
 if (!is.null(inv)) {
   return(inv)
 }
 data <- x$get()
 inv <- solve(data, ...)
 x$setInverse(inv)
 return(inv)
}
