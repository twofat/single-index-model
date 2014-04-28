require(MASS)

  generate = function(n,p,rho){
    sigma = matrix(,p,p)
    for(i in 1:p){
      for(j in 1:p){
        sigma[i,j] = rho^(abs(i-j))
      }
    }
    mvrnorm(n,rep(0,p),sigma)
  }
 
  matsqrt = function(x){
    eig = eigen(x)
    temp = diag(sqrt(eig$value))
    result = eig$vector %*% temp %*% t(eig$vector)
    return(result)
  }
  dmultinorm = function(x, mean, cov){
    k = length(mean)
    if(k>1){
      C = 1/sqrt((2*pi)^k*abs(det(cov)))
    }
    else{
      C = 1/sqrt((2*pi)^k*abs(cov))
    }
    v = as.matrix( x - mean )
    invcov = solve(cov)
    tmp1 = exp(-0.5* t(v) %*% invcov %*% v)
    print(tmp1)
    tmp2 = invcov %*% v
    print(tmp2)
    return(C*tmp1)
  }
  
  der_dmultinorm = function(x, mean, cov){
    k = length(mean)
    if(k>1){
      C = -1/sqrt((2*pi)^k*abs(det(cov)))
    }
    else{
      C = -1/sqrt((2*pi)^k*abs(cov))
    }
    v = as.matrix( x - mean )
    invcov = solve(cov)
    tmp1 = drop(exp(-0.5* t(v) %*% invcov %*% v))
    tmp2 = invcov %*% v
    return(C*tmp1*tmp2)
  }
der_K = function(x){
  temp = der_dmultinorm(x, rep(0,length(x)), diag(length(x)))
  return(temp)
}



