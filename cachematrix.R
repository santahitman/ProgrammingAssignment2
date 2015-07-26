## 4 functions, set - to set matrix, get to get it, setinverse to set inverse matrix, getinverse to get inverse matrix
## + Comments in code

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y,rows) { 			# y - data of the matrix, rows - size of the matrix (rows*rows)
    x <<- matrix(y,rows,rows)
    inverse <<- NULL
  }
  get <- function()
  {
    x 
  }
  setinverse <- function(inv) inverse <<- inv
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Check if inverse matrix exists, if it doesn't, it creates new inverse matrix, else it returns existing one
## + Comments in code

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {  			#checks if inverse is null, if not,get cached data
    message("getting cached data")
    return(inverse) 				#return cached data
  }
  data <- x$get() 					#get data from function list
  inverse <- solve(data, ...) 		#make inverse matrix
  x$setinverse(inverse) 			#set new inverse matrix and return it
  inverse
}
