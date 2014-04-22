function beta = est_beta(hset, order, array)
[waste,n] = size(order);
q = 2;
nset = [5,10,30,100,200];
tmp = find(nset>=n);
horder = tmp(1);
h = hset(horder);
C = -2/n/(n-1)/(h^(q+1));
temp = array(horder,order,order,:);
temp = reshape(temp, n*n, 2);
sum_k = sum(temp)/2; 
if(n==1)
  sum_result = 0;
else
  sum_result = sum_k;
end
  beta = sum_result .* C;
end
