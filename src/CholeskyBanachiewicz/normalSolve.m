function x = normalSolve(A, b, decomposition)
    L = decomposition(A);
    y = L \ b;
    x = L' \ y;
end
