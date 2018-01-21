function w = kernel_perceptron(a0, X, Y)

%Kernel perceptron algorithm
%   a0 is the initial count vector (1 * n)
%   X is feature values of training examples (d * n)
%   Y is labels of training examples (1 * n)

stopCriteria = 1;
[d,n] = size(X);
maxIter = 100;
yHat = zeros(1,n);
yHatPrev = yHat;

K = polykernel(X,X);

for j=1:maxIter
	for i = 1:n
		yHat(1, i) = kernel_perceptron_pred(a0, Y, K, i);
		if(yHat(1,i) != Y(1,i))
			a0(1,i) = a0(1,i) + 1;
		end
	end
	isEqual = sum(yHat == yHatPrev) / length(yHat);
    if (isEqual >= stopCriteria)
        break;
    end
    yHatPrev = yHat;
end

w = a0;

