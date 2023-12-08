function systems = randomSystemsGenerator(A, x_scale, n)
    systems = struct('x', cell(1, n), 'b', cell(1, n));
    for i = 1:n
        x = rand(size(A, 1), 1) * x_scale; % Generowanie wektora x
        b = A * x; % Obliczanie wektora b
        systems(i).x = x; % Zapisanie wektora x do struktury
        systems(i).b = b; % Zapisanie wektora b do struktury
    end
end
