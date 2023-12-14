function avgError = cbSolveError(p, scale, x_scale, n, solve, decomposition)
    totalError = 0;

    for i = 1:n
        % Generowanie nowej macierzy A dla każdej iteracji
        A = randomMatrixGenerator(p, scale);

        % Generowanie systemów {x, b} dla danej macierzy A
        systems = randomSystemsGenerator(A, x_scale, n);

        for j = 1:n
            % Prawdziwy wektor x
            trueX = systems(j).x;

            % Wektor b
            b = systems(j).b;

            % Rozwiązanie układu równań Ax = b
            estimatedX = solve(A, b, decomposition);

            % Obliczanie błędu (na przykład normy euklidesowej różnicy wektorów)
            error = norm(trueX - estimatedX);

            % Sumowanie błędów
            totalError = totalError + error;
        end
    end

    % Obliczanie średniego błędu
    avgError = totalError / (n * n);
end
