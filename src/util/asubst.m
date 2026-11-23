% function y = asubst(G)
%
% Voer een achterwaartse substitutie uit op de matrix die je bekomt na
% Gauss-eliminatie.
%
% Input:
%   G               stelsel in bovendriehoeksvorm gebracht door gauss1 of
%                   gauss2, matrix [n x (n+2)] of [n x (n+1)] (zonder
%                   permutatie gedeelte)
% Output:
%   y               oplossing van het stelsel, vector [n x 1]

function y = asubst(G)

n = size(G, 1);
y = zeros(n, 1);

% Terugsubstitutie (= achterwaartse substitutie) voor een bovendriehoekig
% stelsel
for k = n:-1:1
    y(k) = G(k, n+1);
    for i = k+1:n
        y(k) = y(k) - G(k, i) * y(i);
    end;
    y(k) = y(k) / G(k, k);
end
