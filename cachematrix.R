## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

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
> A <- matrix(c(1,2,3,4,5,6),3,3,3)
> A1 <- makeCacheMatrix(A)
> cacheSolve(A1) 
 Error in solve.default(data, ...) : 
  Lapack routine dgesv: system is exactly singular: U[3,3] = 0 
> A <- matrix(c(1,2,3,4,5,6),3,3,3)
> A <- matrix(c(1,2,3,4,5,6),3,3)
> B <- matrix(c(1,2,3,4), 2,2)
> A1 <- matrix(c(1,2,3,4),2,2)
> A2 <- makeCacheMatrix(A1)
> cacheSolve (A2)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
