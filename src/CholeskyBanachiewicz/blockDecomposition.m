function L = blockDecomposition(A)
    % blockDecomposition Dokonuje blokowej dekompozycji macierzy kwadratowej
    %
    %   Dokonuje blokowej dekompozycji macierzy kwadratowej A.
    %   Macierz A jest dzielona na mniejsze bloki, które są następnie dekomponowane
    %   osobno. Wynik dekompozycji każdego bloku jest umieszczany w macierzy L.
    %
    %   Wejście:
    %       A - Macierz kwadratowa, która ma być poddana dekompozycji blokowej.
    %           Macierz A musi być kwadratowa, w przeciwnym razie funkcja zgłosi błąd.
    %
    %   Wyjście:
    %       L - Macierz wynikowa dekompozycji blokowej macierzy A. Macierz L ma taki sam
    %           rozmiar jak macierz A i zawiera bloki wynikowe dekompozycji.
    %
    [n, m] = size(A);
    if n ~= m
        error('Matrix A must be square');
    end

    blockSize = n / 3;

    L = zeros(n);

    for i = 1:blockSize:n
        
        iblock = i:min(i+blockSize-1, n);
        
        L(iblock, iblock) = normalDecomposition(A(iblock, iblock));
        if i + blockSize <= n
            
            nextBlock = (i+blockSize):n;

            L(nextBlock, iblock) = A(nextBlock, iblock) / L(iblock, iblock)';
        end
    end
end
