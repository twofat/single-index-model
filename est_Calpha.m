function [Calpha,result] = est_Calpha(X,halfcov,hset,array,iter)
[n, p] = size(X);
result = zeros(1, iter);
for k = 1:iter
    sample = randsample(n,n);
    tempX = X(sample,:);
    result(k) = est_Tn(tempX, halfcov, hset, array(:,sample,sample,:),0);
end
Calpha = quantile(result, 0.9);
end
