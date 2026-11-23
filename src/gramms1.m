function [Q,R] = gramms1(A)

[n,n] = size(A);

V=A;

R=zeros(n,n);
Q=zeros(n,n);

for i=1:n
    R(i,i) = norm(V(:,i), 2);
    Q(i) = V(:, i) / R(i,i);
    for j=i+1:n
        % ' is hermitisch toegevoegde
        R(i,j) = Q(:, i)' * V(:, j);
        V(:, j) = V(: , j) - R(i,j)*Q(:, i);
    end
end
end