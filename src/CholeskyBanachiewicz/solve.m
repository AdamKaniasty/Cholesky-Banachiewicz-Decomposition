function x = solve(A, b)
    L = decomposition(A);    
    y = L \ b;
    x = L' \ y;
end
