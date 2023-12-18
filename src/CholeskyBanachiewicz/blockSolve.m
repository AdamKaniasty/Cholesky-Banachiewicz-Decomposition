function x = blockSolve(A, b, decomposition)
    % blockSolve Rozwiązuje układ równań liniowych przy użyciu dekompozycji blokowej
    %
    %   Rozwiązuje układ równań Ax = b, gdzie A jest
    %   symetryczną, dodatnio określoną macierzą kwadratową. Funkcja wykorzystuje
    %   podaną funkcję 'decomposition' do wykonania dekompozycji Cholesky'ego-Banachiewicza macierzy A,
    %   a następnie stosuje podstawienie w przód i w tył do rozwiązania układu.
    %
    %   Wejście:
    %       A - Macierz kwadratowa w układzie równań Ax = b.
    %       b - Wektor wyrazów wolnych w układzie równań Ax = b.
    %       decomposition - Funkcja do dekompozycji macierzy A.
    %
    %   Wyjście:
    %       x - Rozwiązanie układu równań Ax = b.
    
    L = decomposition(A);  
    
    y = forwardSubstitutionBlock(L, b);
    
    x = backwardSubstitutionBlock(L', y);
end

function y = forwardSubstitutionBlock(L, b)
    % forwardSubstitutionBlock Wykonuje podstawienie w przód dla układu równań
    %
    %   Rozwiązuje układ równań Ly = b, gdzie L jest
    %   dolną macierzą trójkątną uzyskaną z dekompozycji blokowej, a b jest wektorem.
    %   Funkcja stosuje podstawienie w przód dla rozwiązania układu równań.
    %
    %   Wejście:
    %       L - Dolna macierz trójkątna.
    %       b - Wektor wyrazów wolnych w układzie równań Ly = b.
    %
    %   Wyjście:
    %       y - Rozwiązanie układu równań Ly = b.
    n = size(L, 1);
    blockSize = n / 3;  
    y = zeros(size(b));
    
    for i = 1:3  
        blockStart = (i-1)*blockSize + 1;
        blockEnd = i*blockSize;
        L_ii = L(blockStart:blockEnd, blockStart:blockEnd);
        
        if i == 1
            y(blockStart:blockEnd) = L_ii \ b(blockStart:blockEnd);
        else
            sumLijYj = L(blockStart:blockEnd, 1:blockStart-1) * y(1:blockStart-1);
            y(blockStart:blockEnd) = L_ii \ (b(blockStart:blockEnd) - sumLijYj);
        end
    end
end

function x = backwardSubstitutionBlock(U, y)
    % backwardSubstitutionBlock Wykonuje podstawienie w tył dla układu równań
    %
    %   Rozwiązuje układ równań Ux = y, gdzie U jest
    %   górną macierzą trójkątną uzyskaną z dekompozycji blokowej, a y jest wektorem.
    %   Funkcja stosuje podstawienie w tył dla rozwiązania układu równań.
    %
    %   Wejście:
    %       U - Górna macierz trójkątna.
    %       y - Wektor wyrazów wolnych w układzie równań Ux = y.
    %
    %   Wyjście:
    %       x - Rozwiązanie układu równań Ux = y.
    n = size(U, 1);
    blockSize = n / 3;  
    x = zeros(size(y));
    
    for i = 3:-1:1  
        blockStart = (i-1)*blockSize + 1;
        blockEnd = i*blockSize;
        U_ii = U(blockStart:blockEnd, blockStart:blockEnd);
        
        if i == 3
            x(blockStart:blockEnd) = U_ii \ y(blockStart:blockEnd);
        else
            sumUijXj = U(blockStart:blockEnd, blockEnd+1:end) * x(blockEnd+1:end);
            x(blockStart:blockEnd) = U_ii \ (y(blockStart:blockEnd) - sumUijXj);
        end
    end
end
