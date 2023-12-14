function x = blockSolve(A, b, decomposition)
    % Assuming the block Cholesky decomposition function is named 'blockCholesky'
    % and it returns L such that A = L*L'
    L = decomposition(A);  % Your block Cholesky decomposition function
    
    % Forward substitution to solve L*y = b for y
    y = forwardSubstitutionBlock(L, b);
    
    % Backward substitution to solve L'*x = y for x
    x = backwardSubstitutionBlock(L', y);
end

function y = forwardSubstitutionBlock(L, b)
    n = size(L, 1);
    blockSize = n / 3;  % Assuming that the block size is n/3 based on the 3p x 3p structure
    y = zeros(size(b));
    
    for i = 1:3  % There are 3 blocks along the diagonal
        blockStart = (i-1)*blockSize + 1;
        blockEnd = i*blockSize;
        L_ii = L(blockStart:blockEnd, blockStart:blockEnd);
        
        if i == 1
            y(blockStart:blockEnd) = L_ii \ b(blockStart:blockEnd);
        else
            sumLijYj = L(blockStart:blockEnd, 1:blockStart-1) * y(1:blockStart-1);
            y(blockStart:blockEnd) = L_ii \ (b(blockStart:blockEnd) - sumLijYj);
        end
    end
end

function x = backwardSubstitutionBlock(U, y)
    n = size(U, 1);
    blockSize = n / 3;  % Assuming the block size is n/3
    x = zeros(size(y));
    
    for i = 3:-1:1  % There are 3 blocks along the diagonal
        blockStart = (i-1)*blockSize + 1;
        blockEnd = i*blockSize;
        U_ii = U(blockStart:blockEnd, blockStart:blockEnd);
        
        if i == 3
            x(blockStart:blockEnd) = U_ii \ y(blockStart:blockEnd);
        else
            sumUijXj = U(blockStart:blockEnd, blockEnd+1:end) * x(blockEnd+1:end);
            x(blockStart:blockEnd) = U_ii \ (y(blockStart:blockEnd) - sumUijXj);
        end
    end
end
