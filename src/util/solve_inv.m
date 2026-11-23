function [x] = solve_inv(A,b)
%   Oplossen van een stelsel door inverteren
    x = inv(A) * b;
end