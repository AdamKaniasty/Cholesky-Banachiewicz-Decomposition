function isEqual = equalCheck(A, L, n)
    precision = 10^(-n);
    B = L * L';
    absError = abs(A - B);
    isEqual = all(all(absError < precision));
end
