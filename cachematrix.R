## Put comments here that give an overall description of what your
## functions do

makeCacheMatrix <- function(x = matrix()) {
+     i <- NULL
+     set <- function(y) {
+         x <<- y
+         i <<- NULL
+     }
+     get <- function() x
+     setinverse <- function(inverse) i <<- inverse
+     getinverse <- function() i
+     list(set = set, get = get,
+          setinverse = setinverse,
+          getinverse = getinverse)
+ }

##  The 'makeCacheMatrix' function takes an input matrix and sets up a list of 
##  functions as follows:
##    1 (set_init):  This allows the user to reset the value of the initial matrix
##    2 (get_init):  This returns the value of the initial matrix
##    3 (set_inv):   This sets the cached inverse of the initial matrix
##    4 (get_inv):   This returns the cached inverse of the initial matrix.

> cacheSolve <- function(x, ...) {
+     i <- x$getinverse()
+     if (!is.null(i)) {
+         message("getting cached data")
+         return(i)
+     }
+     data <- x$get()
+     i <- solve(data, ...)
+     x$setinverse(i)
+     i
+     
+ }

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
cacheSolve(sp_mtx)     [on first run calculates inverse of matrix]       
cacheSolve(sp_mtx)     [on second run returns cached value of inverse]   
sp_mtx$set_init        resets initial matrix                             
## p_mtx$get_init: it returns initial matrix                            
## sp_mtx$set_inv: it sets the cached value of the inverse matrix       
## sp_mtx$get_inv: it returns cached value of the inverse matrix        

