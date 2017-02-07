-## Put comments here that give an overall description of what your
 -## functions do
 -
 -## Write a short comment describing this function
 -
 -makeCacheMatrix <- function(x = matrix()) {
 -
 -}
 -
 -
 -## Write a short comment describing this function
 -
 -cacheSolve <- function(x, ...) {
 -        ## Return a matrix that is the inverse of 'x'
 -}
 +## Put comments here that give an overall description of what your
 +## functions do
 +
 +## This function creates a special Matrix object that can
 +## cache its inverse
 +
 +makeCacheMatrix <- function(x = matrix()) {
 +  m <- NULL
 +  set <- function(y) {
 +    x <<- y
 +    m <<- NULL
 +  }
 +  get <- function() x
 +  setsolve <- function(solve) m <<- solve
 +  getsolve <- function() m
 +  list(set = set, get = get,
 +       setsolve = setsolve,
 +       getsolve = getsolve)
 +}
 +
 +
 +## This function computes the inverse of the special "matrix" 
 +## returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), 
 +## then the cachesolve retrieves the inverse from the cache.
 +cacheSolve <- function(x, ...) {
 +        
 +  m <- x$getsolve()
 +  if(!is.null(m)) {
 +    message("getting cached data")
 +    return(m)
 +  }
 +  data <- x$get()
 +  m <- solve(data, ...)
 +  x$setsolve(m)
 +  m
 +}
 +
 +##Define a square Matrix
 +A = matrix(c(2, 4, 3, 1),nrow=2,ncol=2,byrow=TRUE)
 +##To run the matrix through the code define an object,eg Mat <-makeCacheMatrix(A)
 +##Then cacheSolve(Mat)
 +## If you repeat the last line of code you will get the "getting cached data" message