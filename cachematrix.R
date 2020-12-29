## Functions to cache the inverse of the matrix


## First, I created an object for caching the inverse
MatrixObject <- function( m = matrix() ) {
  
  ## Initial item
  i <- NULL
  
  ## Function to set the matrix
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  ## Script to get the matrix
  get <- function() {
    ## The matrix will be returned in this item
    m
  }
  
  ## Now, to set the inverse!
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Getting the inverse
  getInverse <- function() {
    ## Inverse will be returned in this item
    i
  }
  
  ## By last, I list all the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



cachesolution <- function(x, ...) {
  
  m <- x$getInverse()
  
  
  if( !is.null(m) ) {
    message("pulling cache data")
    return(m)
  }
  
  ## Get the matrix from our object
  object_matrix <- x$get()
  
  ## Now, we calculate the inverse 
  m <- solve(object_matrix) %*% object_matrix
  
  ## Last, we set thePro inverse to the object
  x$setInverse(m)
  
  ## Return the matrix
  m
}

