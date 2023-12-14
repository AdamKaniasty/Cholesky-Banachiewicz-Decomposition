function errors = cbSolveErrorForA(A, x_scale, n, decomposition)
    errors = zeros(1, x_scale);

    for x = 1:x_scale
        systems = randomSystemsGenerator(A, x, n);
        totalError = 0;
        for i = 1:n
            % Prawdziwy wektor x
            trueX = systems(i).x;

            % Wektor b
            b = systems(i).b;

            % Rozwiązanie układu równań Ax = b
            estimatedX = blockSolve(A, b, decomposition);

            % Obliczanie błędu (na przykład normy euklidesowej różnicy wektorów)
            error = norm(trueX - estimatedX);

            % Sumowanie błędów
            totalError = totalError + error;
        end

        % Obliczanie średniego błędu dla danego x_scale
        avgError = totalError / n;
        
        % Store the error in the array
        errors(x) = avgError;
    end
end
