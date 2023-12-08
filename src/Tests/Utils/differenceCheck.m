function errorMatrix = differenceCheck(A, L, vis)
    B = L * L';
    errorMatrix = abs(A - B);
    errorMatrix(A ~= 0) = errorMatrix(A ~= 0) ./ A(A ~= 0);
    errorMatrix(A == 0) = 0;

    if vis
        figure;
        heatmap(errorMatrix);
        title('Error Matrix Heatmap');
        xlabel('Column Index');
        ylabel('Row Index');
    end
end
