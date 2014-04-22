n = 100;
t0 = 0.7;
x1 = randn(n,1);
x2 = random('exp',1,n,1);
X = [x1,x2];
epsilon = randn(n,1);
beta1 = [1/sqrt(2);1/sqrt(2)];
beta2 = [1/sqrt(2);-1/sqrt(2)];
y1 = 20.* exp(X(1:(t0*n),:) * beta1) +epsilon(1:(t0*n),1);
y2 = 20.* exp(X((t0*n+1):n,:) * beta2) +epsilon((t0*n+1):n,1);
y = [y1; y2];

[array, hset] = make_array(X,y);
hafcov = est_cov(X,y,hset,array);
disp(est_Tn(X,hafcov,hset,array,1));
disp(est_Calpha(X,hafcov,hset,array,500));
