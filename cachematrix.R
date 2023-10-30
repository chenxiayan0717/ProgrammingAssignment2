## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Function to create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(m) {
  # Initialize the inverse matrix cache
  inverse <- NULL
  
  # Function to set the matrix
  set <- function(matrix) {
    m <<- matrix
    inverse <<- NULL  # Reset the inverse cache when the matrix changes
  }
  
  # Function to get the matrix
  get <- function() m
  
  setInverse <- function(solve) inverse <<- solve()
  getInverse <- function() inverse
  
  
  # Return a list of functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# Function to compute the inverse of the special "matrix" and cache it
cacheSolve <- function(cacheMatrix,...) {
  inverse <- cacheMatrix$getInverse()
  if (!is.null(inverse)) {
    message("Getting cached inverse")
    return(inverse)
  }
  data <- cacheMatrix$get()
  inverse <- solve(data,...)
  cacheMatrix$setInverse(inverse)
  inverse
}
