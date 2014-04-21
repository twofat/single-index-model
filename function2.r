rest_beta = function(X, y){
  n = dim(X)[1]
  h = sd(X)*n^(-1/6)
  q = dim(X)[2]
  C = -2/n/(n-1)/(h^(q+1))
  Xy = cbind(X,y)
  sum = c()
  for(i in 1:n){
    if(i==n){
      break
    }
    tmp = apply(matrix(Xy[(i+1):n,],,q+1),1,
                function(x){
                  der_K((X[i,]-x[1:q])/h)*(y[i]-x[q+1])
                })
    sum = rbind(sum, t(tmp))
  }
  if(n==1){
    sum = 0
  }
  else{
    sum = apply(sum, 2, sum)
  }
  beta = sum * C
  return(beta)
}

est_cov = function(X, y){
  n = dim(X)[1]
  h = sd(X)*n^(-1/6)
  q = dim(X)[2]
  C = 1/(n-1)/(h^(q+1))
  Xy = cbind(X,y)
  rmat = matrix(0,q,q)
  for(i in 1:n){
    tmp = apply(matrix(Xy[-i,],,q+1),1,
                function(x){
                  der_K((X[i,]-x[1:q])/h)*(y[i]-x[q+1])
                })
    rtmp = as.matrix(apply(t(tmp),2,sum)*C)
    rmat = rmat + rtmp %*% t(rtmp) / n
  }
  beta = as.matrix(est_beta(X, y))
  cov = rmat - beta %*% t(beta)
  return(cov)
}

est_Tn = function(x,y,covhat,){
  n = dim(x)[1]
  set = 2:(n-2)
  test = c()
  for(k in set){
    t = k/n
    betahat1 = est_beta(x[1:k,], y[1:k])
    betahat2 = est_beta(x[(k+1):n,],y[(k+1):n])
    temp = as.matrix(betahat1 - betahat2)
    Q = sqrt(n)*t*(1-t)*solve(matsqrt(covhat))%*%temp
    test = c(test, sum(Q^2))
  }
  Tn = max(test)
  return(Tn)
}







