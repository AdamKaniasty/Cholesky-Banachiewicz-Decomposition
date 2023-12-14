function examples = getExamples()
    examples = cell(6, 1);

    examples{1} = [1.4868, -0.4251,  0.3621,  0.5514,  1.3071,  1.4430,  0,       0,       0;
    -0.4251,  2.1929, -0.0825,  0.6682, -1.2480, -0.1117,  0,       0,       0;
     0.3621, -0.0825,  1.3367,  0.1690, -0.2021,  0.1083,  0,       0,       0;
     0.5514,  0.6682,  0.1690,  1.9278, -0.1745,  0.3523,  1.9732, -1.2608, -1.0275;
     1.3071, -1.2480, -0.2021, -0.1745,  2.9997, -0.1688,  0.0295,  0.3904, -0.8289;
     1.4430, -0.1117,  0.1083,  0.3523, -0.1688,  1.3010, -0.3504,  2.0175,  1.8404;
     0,       0,       0,       1.9732,  0.0295, -0.3504,  1.3130,  0.2818, -0.0595;
     0,       0,       0,      -1.2608,  0.3904,  2.0175,  0.2818,  1.5513, -0.4000;
     0,       0,       0,      -1.0275, -0.8289,  1.8404, -0.0595, -0.4000,  2.2410];


     examples{2} = [1.4868, -0.4251,  0.3621,  0, 0, 0,   0,       0,       0;
    -0.4251,  2.1929, -0.0825, 0, 0, 0,  0,       0,       0;
     0.3621, -0.0825,  1.3367,  0, 0,  0,  0,       0,       0;
     0.5514,  0.6682,  0.1690,  1.9278, -0.1745,  0.3523,  1.9732, -1.2608, -1.0275;
     1.3071, -1.2480, -0.2021, -0.1745,  2.9997, -0.1688,  0.0295,  0.3904, -0.8289;
     1.4430, -0.1117,  0.1083,  0.3523, -0.1688,  1.3010, -0.3504,  2.0175,  1.8404;
     0,       0,       0,       0, 0,0   1.3130,  0.2818, -0.0595;
     0,       0,       0,      0, 0, 0,  0.2818,  1.5513, -0.4000;
     0,       0,       0,      0, 0, 0, -0.0595, -0.4000,  2.2410];

     large_value = 1e6;
     examples{3} = large_value * ones(9, 9);
     examples{3} = examples{3} + eye(size(examples{3})) * 1e3;
     examples{3}(1:3, 7:9) = zeros(3);
     examples{3}(7:9, 1:3) = zeros(3);

     % Second matrix with very small values everywhere
     small_value = 1e-6;
     examples{4} = small_value * ones(9, 9);
     examples{4} = examples{4} + 1e-4 * eye(size(examples{4}));
     examples{4}(1:3, 7:9) = zeros(3);
     examples{4}(7:9, 1:3) = zeros(3);
    
     % Third matrix with very small values on the diagonal and large values in other blocks
     examples{5} = large_value * (ones(9, 9) - eye(9));
     examples{5}(1:3, 1:3) = small_value * eye(3);
     examples{5}(4:6, 4:6) = small_value * eye(3);
     examples{5}(7:9, 7:9) = small_value * eye(3);

     examples{6} = rand(9,9);
end