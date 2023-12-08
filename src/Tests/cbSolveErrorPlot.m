function cbSolveErrorPlot(maxP, scales, x_scale, n)
    % Przygotowanie danych do wykresu
    pValues = 1:maxP; % Zakres wartości p
    errors = zeros(maxP, length(scales)); % Inicjalizacja tablicy na błędy

    % Obliczanie błędów dla różnych wartości p i scale
    for i = 1:length(scales)
        scale = scales(i);
        for p = pValues
            avgError = cbSolveError(p, scale, x_scale, n);
            errors(p, i) = avgError;
        end
    end

    % Rysowanie wykresu
    plot(pValues, errors, 'LineWidth', 2);
    xlabel('Wartość p');
    ylabel('Średni błąd');
    title('Średni błąd obliczeniowy dla różnych wartości p i scale');
    for i = 1:length(scales)
        legendLabels{i} = ['scale = ' num2str(scales(i))];
    end
    legend(legendLabels, 'Location', 'best');
    grid on;
end
