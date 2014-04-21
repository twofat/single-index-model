function [array, hset] = make_array(X, y)
[n, q] = size(X);
tempX = X(:);
nset = [20,50,100,200];
hset = std(tempX).*nset.^(-1/6);
array = zeros(6,n,n,2);
for j = 1:4
    h = hset(j);
    for k = 1:(n-1)
        Xk = ones((n-k),q) * diag(X(k,:));
        temp = der_K((Xk-X((k+1):n,:))/h);
        temp = (temp * diag(y(k)-y((k+1):n,:)) )';
        array(j,k,(k+1):n,:) = temp;
        array(j,(k+1):n,k,:) = -temp;
    end
end
    
end