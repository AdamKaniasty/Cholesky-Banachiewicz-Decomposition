function [errorMatrix, errorMatrix2] = cbError(maxA, maxB, decomposition, decomposition_2)
    nIterations = 10; % Number of iterations for each pair of parameters
    errorMatrix = zeros(maxA, ceil(maxB/10)); % Initialize a matrix to store the errors
    errorMatrix2 = zeros(maxA, ceil(maxB/10)); % Initialize a matrix to store the errors

    for a = 1:maxA
        for b = 1:10:maxB % Iterate over every 10th value of b
            totalError = 0;
            totalError2 = 0;
            for i = 1:nIterations
                % Generate matrix A using randomMatrixGenerator
                A = randomMatrixGenerator(a, b);

                % Decompose A using decomposition
                L = decomposition(A);
                
                L2 = decomposition_2(A);

                % Calculate error using differenceCheck
                error = sum(sum(differenceCheck(A, L, false))) / size(A, 1) / size(A, 1);
                
                error2 = sum(sum(differenceCheck(A, L2, false))) / size(A, 1) / size(A, 1);

                % Summing up the errors
                totalError = totalError + error;

                totalError2 = totalError2 + error2;
            end

            % Calculate average error
            avgError = totalError / nIterations;
            avgError2 = totalError2 / nIterations;

            % Store the average error in the matrix
            errorMatrix(a, ceil(b/10)) = abs(avgError);
            errorMatrix2(a, ceil(b/10)) = abs(avgError2);
        end
    end
end
