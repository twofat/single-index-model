function beta = est_beta(hset, order, array)
[waste,n] = size(order);
q = 2;
nset = [20,50,100,200];
tmp = find(nset>=n);
horder = tmp(1);
h = hset(horder);
C = -2/n/(n-1)/(h^(q+1));
sum_k = zeros(1,q);
for k = 1:(n-1)
    temp = array(horder,order(k),order((k+1):n),:);
    temp = reshape(temp, n-k, 2);
    sum_temp = sum(temp);
    sum_k = sum_k+ sum_temp;    
end
if(n==1)
  sum_result = 0;
else
  sum_result = sum_k;
end
  beta = sum_result .* C;
end