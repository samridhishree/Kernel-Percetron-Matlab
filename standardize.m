function [ Xnew ] = standardize( X )
%STANDARDIZE: standardize input matrix X
%   Center the mean of each feature to 0
%   Adjust each feature to have variance 1

% X is d * n

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your code goes here:
s = std(X, [], 2);
m = mean(X, 2);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Xnew = bsxfun(@minus, X, m);
Xnew = bsxfun(@rdivide, Xnew, s + 1e-5);

end

