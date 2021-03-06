function hafcov = est_cov(X, y,hset, array)
[n, q] = size(X);
nset = [5,10,30,100,200];
tmp = find(nset>=n);
horder = tmp(1);
h = hset(horder);
C = 1/(n-1)/(h^(q+1));
rmat = zeros(q);
for m = 1:n
    set = 1:n;
    set(m) = [];
    Xm = ones((n-1),q) * diag(X(m,:));
    temp = C .* der_K((X(set,:)-Xm)/h);
    rtemp = (temp * diag(y(set)-y(m)))';
    rm = sum(rtemp);
    rmat = rmat + (rm' * rm) ./ n;
end    
beta = est_beta(hset, 1:n, array);
cov = rmat - beta' * beta;
hafcov = sqrtm(cov);
end

