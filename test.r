setwd("E://Quality Control//wzf//code")
source("E://Quality Control//wzf//code//functions.r")
source("E://Quality Control//wzf//code//function2.r")

n = 100
t0 = 0.6

x1 = rnorm(n,0,1)
x2 = rexp(n)
x = cbind(x1, x2)
X = cbind(rep(1,n),x)
epsilon = rnorm(n, 0, 1)
beta1 = as.matrix(c (0,1/sqrt(2),1/sqrt(2)))
beta2 = as.matrix(c(0,1/sqrt(2),-1/sqrt(2)))
y1 = 20*exp(X[1:(t0*n),]%*%beta1) +epsilon[1:(t0*n)]
y2 = 20*exp(X[(t0*n+1):n,]%*%beta2) +epsilon[(t0*n+1):n]
y = c(y1, y2)

covhat = est_cov(x,y)
t = 0.6
est_beta(x[1:(n*t),],y[1:(n*t)])
est_beta(x[(t*n+1):n,],y[(t*n+1):n])

time = proc.time()
Tn = est_Tn(x,y,covhat)
print(Tn)
print(proc.time()-time)

Tnstarset = c()
for(flag in 1:100){
  order = sample(n)
  xtmp = x[order,]
  ytmp = y[order]
  Tnstarset = c(Tnstarset, est_Tn(xtmp,ytmp,covhat))
}

hist(Tnstarset, 30)
Calpha = quantile(Tnstarset, probs=0.8)
print(Calpha)





