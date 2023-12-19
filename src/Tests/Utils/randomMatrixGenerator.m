function A = randomMatrixGenerator(p, scale)
    n = 3*p;
    posdef = 1;
    while(posdef ~= 0)
        A = zeros(n, n);
        eigenvalues = abs(randn(p, 3)) * scale + scale;
        for i = 1:3
            Q = orth(randn(p));
            Lambda = diag(eigenvalues(:, i));
            A_ij = Q * Lambda * Q';
            A((i-1)*p+1:i*p, (i-1)*p+1:i*p) = A_ij;
        end

        for i = 1:2
            Q = orth(randn(p));
            Lambda = diag(eigenvalues(:, i));
            A_ij = Q * Lambda * Q';
            A_ij = A_ij .* 0.1;
            A((i-1)*p+1:i*p, i*p+1:(i+1)*p) = A_ij;
            A(i*p+1:(i+1)*p, (i-1)*p+1:i*p) = A_ij';
        end

        [~, posdef] = chol(A);
    end
end