function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
%
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

K = num_labels;
X = [ones(m, 1) X];

% README before progressing to read. Instead of looping over all the input
% parameters, I changed the output matrix, each row of y_mat is now equivalent
% of the output matrix we want to show for each row in input X
% This is an alternate solution I wrote.

% === Alternate solution without regularization =============

y_mat = zeros(m, K);
for j = 1:m
    y_j = zeros(1,K);
    y_j(y(j)) = 1;
    y_mat(j, :) = y_j;
end;

a1 = X;
z2 = a1 * Theta1';
a2 = sigmoid(z2);

a2 = [ones(size(a2, 1), 1) a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3);

inner_sum = (-y_mat .* log(a3) - (1 - y_mat) .* log(1 - a3));
J = sum(sum(inner_sum, 2));

% === Alternate solution ends ================

% === Solution according to the excercise guide ===

% for i = 1:m
%     X_i = X(i,:);

%     a1 = X_i;
%     z2 = a1 * Theta1';
%     a2 = sigmoid(z2);

%     a2 = [1 a2];
%     z3 = a2 * Theta2';
%     a3 = sigmoid(z3);

%     % Making sure the y is a vector output for X_i
%     y_i = zeros(1,K);
%     y_i(y(i)) = 1; % making sure the ith index is 1 here as output

%     inner_sum = (-y_i .* log(a3) - (1 - y_i) .* log(1 - a3));
%     J = J + sum(inner_sum);
% end;

% === Solution according to the excercise guide ends =====

J = 1/m * J;

% === Regularization part based on the excercise 3, can be simplified
% Kept it this way because this is easy to understand

temp_theta1 = Theta1(:, 2:input_layer_size + 1);
temp_theta2 = Theta2(:, 2:hidden_layer_size + 1);

reg_terms = lambda/(2*m) * (sum(sum(temp_theta1.^2)) + sum(sum(temp_theta2.^2)));

J = J + reg_terms;
























% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
