function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
%X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th
%               column of X contains the values of X to the p-th power.
%
%

% We can use repmat method here. But I preferred a loop since this is
% easy for me to understand and there is a lesser chance of using octave
% in production for me so I don't want to dive that deep in octave/matlab

X_poly = X;

for i = 2:p
    X_poly = [X_poly, X(:, 1).^i];
end;

% =========================================================================

end
