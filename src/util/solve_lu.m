function x = solve_lu(A, b)
x = asubst(gauss1([A b]));
end
