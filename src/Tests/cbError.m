function resultsTable = cbError(maxA, maxB)
    nIterations = 25; % Liczba iteracji dla każdej pary parametrów
    results = []; % Inicjalizacja tablicy do przechowywania wyników

    for a = 1:maxA
        for b = 1:maxB
            totalError = 0;
            for i = 1:nIterations
                % Generowanie macierzy A przy użyciu randomMatrixGenerator
                A = randomMatrixGenerator(a, b);

                % Rozkład A za pomocą decomposition
                L = decomposition(A);

                % Obliczanie błędu przy użyciu differenceCheck
                error = sum(sum(differenceCheck(A, L, false))) / sum(sum(A));
                
                % Sumowanie błędów
                totalError = totalError + error;
            end

            % Obliczanie średniego błędu
            avgError = totalError / nIterations;

            % Dodanie wyników do tablicy
            results = [results; a, b, abs(avgError)];
        end
    end

    % Przekształcenie wyników na tabelę
    resultsTable = array2table(results, 'VariableNames', {'P value', 'Scale', 'AverageError'});
end
