A = randomMatrixGenerator(3, 3)
x = rand(size(A, 1), 1)
b = A * x;
normalSolve(A, b, @normalDecomposition);
blockSolve(A, b, @blockDecomposition)