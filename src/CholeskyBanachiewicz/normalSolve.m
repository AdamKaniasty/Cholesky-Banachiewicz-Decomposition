function x = normalSolve(A, b, decomposition)
    % normalSolve Rozwiązuje układ równań liniowych za pomocą standardowej dekompozycji
    %
    %   Rrozwiązuje układ równań Ax = b, gdzie A jest
    %   symetryczną, dodatnio określoną macierzą kwadratową. Funkcja wykorzystuje
    %   podstawienie w przód i w tył do rozwiązania układu.
    %
    %   Wejście:
    %       A - Macierz kwadratowa w układzie równań Ax = b.
    %       b - Wektor wyrazów wolnych w układzie równań Ax = b.
    %       decomposition - Funkcja do dekompozycji macierzy A.
    %
    %   Wyjście:
    %       x - Rozwiązanie układu równań Ax = b.
    %
    L = decomposition(A);
    y = L \ b;
    x = L' \ y;
end
