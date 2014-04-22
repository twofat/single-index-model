n = 200;
t0 = 0.5;
x1 = randn(n,1);
x2 = random('exp',1,n,1);
X = [x1,x2];
epsilon = randn(n,1);
beta1 = [1/sqrt(2);1/sqrt(2)];
beta2 = [1/sqrt(2);-1/sqrt(2)];
y1 = 20.* exp(X(1:(t0*n),:) * beta1) +epsilon(1:(t0*n),1);
y2 = 20.* exp(X((t0*n+1):n,:) * beta2) +epsilon((t0*n+1):n,1);
Y = [y1; y2];

Calphaset = zeros(1,n-100);
Tnset = zeros(1,n-100);
for flag = 105:5:n
    x = X((flag-100):flag,:);
    y = Y((flag-100):flag,:);
    [array, hset] = make_array(x,y);
    halfcov = est_cov(x,y,hset,array);
    [Tn,test] = est_Tn(x,halfcov,hset,array,0);
    [Calpha, result] = est_Calpha(x,halfcov,hset,array,500);
    Calphaset(flag-100) = Calpha;
    Tnset(flag-100) = Tn;
    disp([flag-100, Tn, Calpha]);
    if Calpha < Tn
        break;
    end
end
