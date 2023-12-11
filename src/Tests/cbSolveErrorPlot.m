function cbSolveErrorPlot(appAxes, maxP, scales, x_scale, n)
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

    % Rysowanie wykresu na podanym osiach (appAxes)
    plot(appAxes, pValues, errors, 'LineWidth', 2);
    xlabel(appAxes, 'Wartość p');
    ylabel(appAxes, 'Średni błąd');
    title(appAxes, 'Średni błąd obliczeniowy dla różnych wartości p i scale');
    legendLabels = cell(1, length(scales));
    for i = 1:length(scales)
        legendLabels{i} = ['scale = ' num2str(scales(i))];
    end
    legend(appAxes, legendLabels, 'Location', 'best');
    grid(appAxes, 'on');
end
