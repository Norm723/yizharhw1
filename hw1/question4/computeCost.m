function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression.
% Computes the cost of using theta as the parameters for linear regression
% to fit the data points in X and y
% Input arguments:
% X - the input matrix, where the observations (features) are in rows.
% y - the outputs (labels) for each input sample
% theta - the parameters values, weights of the measured features
% Output arguments:
% J - the cost function for theta
% Usage: J = computeCost(X, y, theta) 

% Initialization
m = length(y); % number of training examples
delta=X*theta-y;

J = sum(delta.^2)/(2*m);
end

