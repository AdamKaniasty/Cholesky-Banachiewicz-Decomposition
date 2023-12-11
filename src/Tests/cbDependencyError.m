function dependencyMatrix = cbDependencyError(maxP, maxScale, n)

    dependencyMatrix = zeros(maxP, maxScale);

    for p = 1:maxP
        for scale = 1:maxScale
            A = randomMatrixGenerator(p, scale);
            systems = randomSystemsGenerator(A, scale, n);
            L = decomposition(A);
            errors_a = cbSolveErrorForAwithSystems(A, n, systems);
            errors_l = cbSolveErrorForAwithSystems(L, n, systems);
            dependencyMatrix(p, scale) = abs(errors_a - errors_l);
        end
    end
end
