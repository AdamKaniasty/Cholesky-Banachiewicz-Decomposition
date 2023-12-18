function [errorMatrix, errorMatrix2] = cbError(maxA, maxB, decomposition, decomposition_2)
    nIterations = 10; 
    errorMatrix = zeros(maxA, ceil(maxB/10)); 
    errorMatrix2 = zeros(maxA, ceil(maxB/10)); 

    for a = 1:maxA
        for b = 1:10:maxB 
            totalError = 0;
            totalError2 = 0;
            for i = 1:nIterations
                
                A = randomMatrixGenerator(a, b);

                
                L = decomposition(A);
                
                L2 = decomposition_2(A);

                
                error = sum(sum(differenceCheck(A, L, false))) / size(A, 1) / size(A, 1);
                
                error2 = sum(sum(differenceCheck(A, L2, false))) / size(A, 1) / size(A, 1);

                
                totalError = totalError + error;

                totalError2 = totalError2 + error2;
            end

            
            avgError = totalError / nIterations;
            avgError2 = totalError2 / nIterations;

            
            errorMatrix(a, ceil(b/10)) = abs(avgError);
            errorMatrix2(a, ceil(b/10)) = abs(avgError2);
        end
    end
end
