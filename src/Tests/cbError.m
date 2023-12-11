function errorMatrix = cbError(maxA, maxB)
    nIterations = 20; % Number of iterations for each pair of parameters
    errorMatrix = zeros(maxA, maxB); % Initialize a matrix to store the errors

    for a = 1:maxA
        for b = 1:maxB
            totalError = 0;
            for i = 1:nIterations
                % Generate matrix A using randomMatrixGenerator
                A = randomMatrixGenerator(a, b);

                % Decompose A using decomposition
                L = decomposition(A);

                % Calculate error using differenceCheck
                error = sum(sum(differenceCheck(A, L, false))) / sum(sum(A));
                
                % Summing up the errors
                totalError = totalError + error;
            end

            % Calculate average error
            avgError = totalError / nIterations;

            % Store the average error in the matrix
            errorMatrix(a, b) = abs(avgError);
        end
    end