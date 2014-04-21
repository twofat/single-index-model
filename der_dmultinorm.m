function result = der_dmultinorm(x, mean, cov)
k = length(mean);
if(k>1)
    C = -1/sqrt((2*pi)^k*abs(det(cov)));
else
    C = -1/sqrt((2*pi)^k*abs(cov));
end
    v = x - mean;
    tmp1 = exp(diag(-0.5* v * (cov \ v')));
    tmp2 = cov \ v';
    tmp1 = diag(tmp1);
    result = C .* tmp2 * tmp1;
end
  