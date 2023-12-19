function cbSolveErrorPlot(appAxes, maxP, scales, x_scale, n)
    % Preparing data for the plot
    pValues = 1:maxP; % Range of p values
    errors = zeros(maxP, length(scales)); % Initializing arrays for errors
    errors2 = zeros(maxP, length(scales));
    timeErrors = zeros(1, length(scales)); % For storing time for errors
    timeErrors2 = zeros(1, length(scales)); % For storing time for errors2

    % Calculating errors for different values of p and scale
    for i = 1:length(scales)
        scale = scales(i);
        for p = pValues
            A = randomMatrixGenerator(p, scale);
            systems = randomSystemsGenerator(A, x_scale, n);

            tic; % Start timer for errors
            avgError = cbSolveErrorForAwithSystems(A, n, systems, @blockSolve, @blockDecomposition);
            timeErrors(i) = timeErrors(i) + toc; % Accumulate time

            tic; % Start timer for errors2
            avgError2 = cbSolveErrorForAwithSystems(A, n, systems, @normalSolve, @normalDecomposition);
            timeErrors2(i) = timeErrors2(i) + toc; % Accumulate time

            errors(p, i) = avgError;
            errors2(p, i) = avgError2;
        end
    end

    cla(appAxes);
    % Plotting on the provided axes (appAxes)
    hold(appAxes, 'on'); % Hold on to combine plots
    for i = 1:length(scales)
        plot(appAxes, pValues, errors(:, i), 'LineWidth', 2); % Plot errors
        plot(appAxes, pValues, errors2(:, i), '--', 'LineWidth', 2); % Plot errors2 with a dashed line
    end
    hold(appAxes, 'off'); % Release hold

    % Setting labels and title
    xlabel(appAxes, 'Wartość p');
    ylabel(appAxes, 'Średni błąd');
    title(appAxes, 'Średni błąd obliczeniowy dla różnych wartości p i scale');

    % Creating legend labels
    legendLabels = cell(1, 2*length(scales));
    for i = 1:length(scales)
        legendLabels{2*i-1} = sprintf('scale = %d (block, time: %.2fs)', scales(i), timeErrors(i));
        legendLabels{2*i} = sprintf('scale = %d (normal, time: %.2fs)', scales(i), timeErrors2(i));
    end
    legend(appAxes, legendLabels, 'Location', 'best');
    
    grid(appAxes, 'on'); % Turning on grid for better visualization
end