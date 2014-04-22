function result = der_K(x)
[n,q] = size(x);
if(q>1)
    C = -1/sqrt((2*pi)^q);
else
    C = -1/sqrt((2*pi)^q);
end
v = x;
tmp2 =  v';
tmp1 = exp(-0.5*sum(v.^2,2));
tmp1 = diag(tmp1);
result = C .* tmp2 * tmp1;
end
