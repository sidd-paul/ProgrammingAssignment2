## These functions generate an invertible matrix using the stored 
## values in the cache and without repititing the whole computation process

## makeCacheMatrix creates the matrix and saves the output in cache

makeCacheMatrix <- function(x = matrix()) {

cache <- NULL

# Matrix creation in the working environment
set <- function(y) {
        x <<- y
        cache <<- NULL
}

# Get the value of the Matrix
get <- function() x

# Inversing the Matrix and caching the value
setMatrix <- function(inverse) cache <<- inverse

# aquire inverted matrix
getInverse <- function() cache

# aquire the executed function in the working env
list(set=set, get=get,
    setMatrix=setMatrix,
    getInverse=getInverse)   
        
}


## cacheSolve calculates the inverse of the matrix generated 
## in the previous step

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of the cached matrix

        # initiating to aquire the inverse matrix from cache  
        cache <- x$getInverse()  

        # aquire the matrix if it exists in cache, otherwise
        # return the matrix in the working env  
        if (!is.null(cache)) {
            message("getting cached data")
            
            return(cache)      
}

# create the new matrix
matrix <- x$get()

# set and return inverse of the matrix
cache<- solve(matrix, ...)

# get the final output
x$setMatrix(cache)
cache 
}
