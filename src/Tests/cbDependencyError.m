function [dependencyMatrix, dependencyMatrix2] = cbDependencyError(maxP, maxScale, n)

    dependencyMatrix = zeros(maxP, maxScale); 
    dependencyMatrix2 = zeros(maxP, maxScale); 

    for p = 1:maxP
        for scale = 1:maxScale
            A = randomMatrixGenerator(p, scale);
            systems = randomSystemsGenerator(A, scale, n);

            L = blockDecomposition(A);
            errors_a = cbSolveErrorForAwithSystems(A, n, systems, @blockSolve, @blockDecomposition);
            errors_l = cbSolveErrorForAwithSystems(L, n, systems, @blockSolve, @blockDecomposition);
            dependencyMatrix(p, scale) = abs(errors_a - errors_l);

            errors_a2 = cbSolveErrorForAwithSystems(A, n, systems, @normalSolve, @normalDecomposition);
            errors_l2 = cbSolveErrorForAwithSystems(L, n, systems, @normalSolve, @normalDecomposition);
            dependencyMatrix2(p, scale) = abs(errors_a2 - errors_l2);
        end
    end
end
