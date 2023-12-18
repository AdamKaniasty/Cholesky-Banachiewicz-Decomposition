function errors = cbSolveErrorForA(A, x_scale, n, decomposition)
    errors = zeros(1, x_scale);

    for x = 1:x_scale
        systems = randomSystemsGenerator(A, x, n);
        totalError = 0;
        for i = 1:n
            
            trueX = systems(i).x;

            
            b = systems(i).b;

            
            estimatedX = blockSolve(A, b, decomposition);

            
            error = norm(trueX - estimatedX);

            
            totalError = totalError + error;
        end

        
        avgError = totalError / n;
        
        
        errors(x) = avgError;
    end
end
