function avgError = cbSolveErrorForAwithSystems(A, n, systems, solve, decomposition)
    totalError = 0;
    for i = 1:n
        % Prawdziwy wektor x
        trueX = systems(i).x;

        % Wektor b
        b = systems(i).b;

        % Rozwiązanie układu równań Ax = b
        estimatedX = solve(A, b, decomposition);

        % Obliczanie błędu (na przykład normy euklidesowej różnicy wektorów)
        error = norm(trueX - estimatedX);

        % Sumowanie błędów
        totalError = totalError + error;
    end

    % Obliczanie średniego błędu dla danego x_scale
    avgError = totalError / n;
end
