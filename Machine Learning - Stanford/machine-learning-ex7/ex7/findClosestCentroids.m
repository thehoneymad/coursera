function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i = 1 : length(X) % loop over the samples
    minimum_dist = 9999999;
    for k = 1 : K % loop over the K centroids
        dist = norm( X(i,:) - centroids(k,:) ) ^ 2;
        % I tried the abs method first, probably wasn't compatible enough
        % Im too tired to read the docs here since my focus isn't octave
        if dist < minimum_dist
            minimum_dist = dist;
            idx(i) = k;
        end
    end
end


% =============================================================

end

