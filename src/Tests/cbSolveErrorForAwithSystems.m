function avgError = cbSolveErrorForAwithSystems(A, n, systems, solve, decomposition)
    totalError = 0;
    for i = 1:n
        
        trueX = systems(i).x;

        
        b = systems(i).b;

        
        estimatedX = solve(A, b, decomposition);

        
        error = norm(trueX - estimatedX);

        
        totalError = totalError + error;
    end

    
    avgError = totalError / n;
end
