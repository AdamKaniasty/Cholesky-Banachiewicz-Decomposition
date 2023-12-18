function cbSolveErrorPlot(appAxes, maxP, scales, x_scale, n)
    
    pValues = 1:maxP; 
    errors = zeros(maxP, length(scales)); 
    errors2 = zeros(maxP, length(scales));
    timeErrors = zeros(1, length(scales)); 
    timeErrors2 = zeros(1, length(scales)); 

    
    for i = 1:length(scales)
        scale = scales(i);
        for p = pValues
            A = randomMatrixGenerator(p, scale);
            systems = randomSystemsGenerator(A, x_scale, n);

            tic; 
            avgError = cbSolveErrorForAwithSystems(A, n, systems, @blockSolve, @blockDecomposition);
            timeErrors(i) = timeErrors(i) + toc; 

            tic; 
            avgError2 = cbSolveErrorForAwithSystems(A, n, systems, @normalSolve, @normalDecomposition);
            timeErrors2(i) = timeErrors2(i) + toc; 

            errors(p, i) = avgError;
            errors2(p, i) = avgError2;
        end
    end

    cla(appAxes);
    
    hold(appAxes, 'on'); 
    for i = 1:length(scales)
        plot(appAxes, pValues, errors(:, i), 'LineWidth', 2); 
        plot(appAxes, pValues, errors2(:, i), '--', 'LineWidth', 2); 
    end
    hold(appAxes, 'off'); 

    
    xlabel(appAxes, 'Wartość p');
    ylabel(appAxes, 'Średni błąd');
    title(appAxes, 'Średni błąd obliczeniowy dla różnych wartości p i scale');

    
    legendLabels = cell(1, 2*length(scales));
    for i = 1:length(scales)
        legendLabels{2*i-1} = sprintf('scale = 
        legendLabels{2*i} = sprintf('scale = 
    end
    legend(appAxes, legendLabels, 'Location', 'best');
    
    grid(appAxes, 'on'); 
end
