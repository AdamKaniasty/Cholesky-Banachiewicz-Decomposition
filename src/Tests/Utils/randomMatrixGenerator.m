function A = randomMatrixGenerator(p, scale)
    % Parametry macierzy blokowej
    n = 3*p; % całkowity wymiar macierzy
    posdef = 0;
    while(posdef == 0)
        A = zeros(n, n); % inicjalizacja macierzy zerami

        % Generowanie losowych, dodatnich wartości własnych dla każdego bloku
        eigenvalues = abs(randn(p, 3)) * scale + scale; % Zapewnia dodatniość
        % Generowanie macierzy blokowych na przekątnej
        for i = 1:3
            Q = orth(randn(p)); % Macierz ortogonalna Q
            Lambda = diag(eigenvalues(:, i)); % Macierz wartości własnych
            A_ij = Q * Lambda * Q'; % Dekompozycja spektralna
            A((i-1)*p+1:i*p, (i-1)*p+1:i*p) = A_ij; % Wstawianie bloku
        end

        % Generowanie symetrycznych bloków poza przekątną
        for i = 1:2
            A_ij = sqrt(scale) .* randn(p, p);
            A((i-1)*p+1:i*p, i*p+1:(i+1)*p) = A_ij;
            A(i*p+1:(i+1)*p, (i-1)*p+1:i*p) = A_ij'; % Wstawianie transpozycji
        end

        % Sprawdzenie, czy macierz jest dodatnio określona
        [~, posdef] = chol(A);
    end
end
