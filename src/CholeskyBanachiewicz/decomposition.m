function L = decomposition(A)
    %DECOMPOSITION Summary of this function goes here
    %   Detailed explanation goes here
    [n, m] = size(A);
    assert(n == m, "A must be a square matrix");

    L = zeros(n, n);

    for i = 1:n
        for j = 1:i
            % Sumowanie dla wyrazów poza przekątną
            sum = 0;
            if j == i % Elementy na przekątnej
                for k = 1:j-1
                    sum = sum + L(j, k)^2;
                end
                L(j, j) = sqrt(A(j, j) - sum);
            else % Elementy poza przekątną
                for k = 1:j-1
                    sum = sum + L(i, k) * L(j, k);
                end
                L(i, j) = (A(i, j) - sum) / L(j, j);
            end
        end
    end
end

