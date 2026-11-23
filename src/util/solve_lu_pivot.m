function x = solve_lu_pivot(A, b)
x = asubst(gauss2([A b]));
end
