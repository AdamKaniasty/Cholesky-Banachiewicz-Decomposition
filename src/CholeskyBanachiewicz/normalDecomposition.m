function L = normalDecomposition(A)
    % blockDecomposition Dokonuje blokowej dekompozycji Cholesky'ego-Banachiewicza
    %
    %   L = blockDecomposition(A) wykonuje blokową dekompozycję Cholesky'ego-Banachiewicza
    %   na symetrycznej, dodatnio określonej macierzy kwadratowej A.
    %
    %   Wejście:
    %       A - Macierz kwadratowa o wymiarach nxn, będąca symetryczną i dodatnio określoną
    %       macierzą, która ma być poddana dekompozycji. Macierz musi spełniać warunek
    %       kwadratowości, w przeciwnym razie funkcja zgłosi błąd.
    %
    %   Wyjście:
    %       L - Macierz trójkątna dolna, będąca wynikiem dekompozycji Cholesky'ego-Banachiewicza
    %       macierzy A. Macierz L jest tej samej wielkości co macierz wejściowa A.
    %
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

