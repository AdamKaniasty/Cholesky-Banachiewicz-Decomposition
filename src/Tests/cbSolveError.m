function avgError = cbSolveError(p, scale, x_scale, n, solve, decomposition)
    totalError = 0;

    for i = 1:n
        
        A = randomMatrixGenerator(p, scale);

        
        systems = randomSystemsGenerator(A, x_scale, n);

        for j = 1:n
            
            trueX = systems(j).x;

            
            b = systems(j).b;

            
            estimatedX = solve(A, b, decomposition);

            
            error = norm(trueX - estimatedX);

            
            totalError = totalError + error;
        end
    end

    
    avgError = totalError / (n * n);
end
