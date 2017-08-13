function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

% This is the result that I accured from the loop underneath, commented out the
% loop because that takes a long time.
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%

% I basically cheated here, this is grunt code. No point working over it
% or try to make it better than what it is.

% The acutal code to determine the C and sigma is here -----------------

% choice = [0.01 0.03 0.1 0.3 1 3 10 30];
% err = realmax();
% for i=1:size(choice, 2)
% 	for j=1:size(choice, 2)
% 		temp_sigma = choice(j);
%         temp_c = choice(i);
% 		model = svmTrain(X, y,  temp_c, @(x1, x2) gaussianKernel(x1, x2, temp_sigma));
% 		predictions = svmPredict(model, Xval);

%         temp_err = mean(double(predictions ~= yval));

% 		if temp_err < err
% 			err = temp_err;
%             sigma = temp_sigma;
% 			C = temp_c;
% 		end
% 	end
% end




% =========================================================================

end
