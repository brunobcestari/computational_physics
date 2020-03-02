X = rand (1000, 20);  % examples
y = rand (1000,  1);   % labels
[m, n] = size (X); % # examples and dimensions
increment = 1;     % # of examples incremented per iteration 
iterations = 5;    % # of times we randomly pick the examples

%% dummy implementation of unspecified functions
function res = trainLogisticReg ()
  res = 0;
endfunction

function res = predict ()
  res = 0;
endfunction

function res = fscore ()
  res = 0;
endfunction

%% dummy values for missing parameters
lambda = 1;
Xval = 1;
yval = 1;

%% inner loop reimplemented as a function
function [errorTrainTotal, errorValTotal] = innerloop (X, y, i, m, lambda, Xval, yval)
  %% Create matrices of randomly selected examples from the training set 
  shuffle = randperm (m, i);
  
  %% Initialise the new random training matrices
  X_random = X (shuffle,:);
  y_random = y (shuffle);
  
  %% Learn the model parameters
  theta = trainLogisticReg (X_random, y_random, lambda);
  
  %% Predict the class of the training examples based on the theta 
  predictions = predict (theta, X_random);
  
  %% Predict the class of the validation examples based on the theta 
  predictionsval = predict (theta, Xval);
  
  %% Compute training and validation f-score errors
  errorTrainTotal =  (1 - fscore (predictions, y_random));
  errorValTotal =  (1 - fscore (predictionsval, yval));
  
endfunction

%% outer loop reimplemented as a function
function [errorTrain, errorVal] = outerloop (X, y, m, i, lambda, Xval, yval, increment, iterations)    
    % randomly select the examples used for training
    % e.g. iterations = 5, then we do this 5 times
    j = 1:iterations;
    [errorTrainTotal, errorValTotal] = arrayfun (@(J) innerloop (X, y, i, m, lambda, Xval, yval), j);
       

    % Calculate the training and validation errors for the current
    % # of examples
    errorTrain = mean (errorTrainTotal);
    errorVal = mean (errorValTotal);
endfunction        



disp ("SERIAL VERSION")
% Train the model incrementally
% e.g. increment = 1, train on 1 example, then 2, then 3 etc...
i = increment:increment:m;
tic
[errorTrain, errorVal] = arrayfun (@(I) outerloop (X, y, m, I, lambda, Xval, yval, increment, iterations), i);
toc

disp ("PARALLEL VERSION")
% Train the model incrementally
% e.g. increment = 1, train on 1 example, then 2, then 3 etc...
pkg load general
tic
i = increment:increment:m;
[errorTrain2, errorVal2] = pararrayfun (2, @(I) outerloop (X, y, m, I, lambda, Xval, yval, increment, iterations), i);
toc
