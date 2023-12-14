function L = blockDecomposition(A)
    % This function performs a block Cholesky decomposition of a symmetric
    % positive definite matrix A. The matrix is divided into blocks of size 
    % 'blockSize'. The output is a lower triangular matrix L such that L*L' = A.

    [n, m] = size(A);
    if n ~= m
        error('Matrix A must be square');
    end

    blockSize = n / 3;

    L = zeros(n);

    for i = 1:blockSize:n
        % Determine the size of the current block
        iblock = i:min(i+blockSize-1, n);
        
        % Decompose the diagonal block
        L(iblock, iblock) = normalDecomposition(A(iblock, iblock));
        if i + blockSize <= n
            % Determine the range of the next block
            nextBlock = (i+blockSize):n;

            % Update the next block
            L(nextBlock, iblock) = A(nextBlock, iblock) / L(iblock, iblock)';
        end
    end
end
