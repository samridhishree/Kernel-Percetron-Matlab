function K = polykernel(X1,X2)
% Homogeneous polynomial kernel of degree-3 with an offset of 1
% X1 is a matrix
% X2 is a matrix

K = [];
K = transpose(X1) * X2;
K = K .+ 1;
K = K .^ 3;