function [Tn,test] = est_Tn(X,halfcov,hset,array,d)
[n, q] = size(X);
test = zeros(1,n);
for k = 2:(n-2)
    t = k/n;
    betahat1 = est_beta(hset, 1:k, array);
    betahat2 = est_beta(hset,(k+1):n, array);
    temp = (betahat1 - betahat2)';
    Q = sqrt(n).*t.*(1-t).* (halfcov \ temp);
    test(k) = sum(Q.^2);
end
if(d)
    disp(test);
end
Tn = max(test);
end










