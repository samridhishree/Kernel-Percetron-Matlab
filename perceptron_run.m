clear variables;
load synthetic_train.mat; load synthetic_test.mat;

% Normalize and center training data
train.X = standardize(train.X);
test.X = standardize(test.X);

% Add a row of 1's as x0 to introduce intercept
train.X = [ones(1, size(train.X, 2)); train.X];
test.X = [ones(1, size(test.X, 2)); test.X];

% Initialize
w0 = zeros(size(train.X, 1),1);

% Train
w = perceptron(w0, train.X, train.y);

% Print out training accuracy
for i=1:size(train.X,2); train_pred(i) = perceptron_pred(w, train.X(:,i)); end
trainnacc = train_pred == train.y;
trainacc = sum(trainnacc) / length(train.y);

fprintf('Your training accuracy is:%6.4f%%\n', 100 * trainacc);

% Print out cross-validation accuracy
for i=1:size(test.X,2); test_pred(i) = perceptron_pred(w, test.X(:,i)); end
testnacc = test_pred == test.y;
testacc = sum(testnacc) / length(test.y);

fprintf('Your test accuracy is:%6.4f%%\n', 100 * testacc);
