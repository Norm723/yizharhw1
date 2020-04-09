function [theta,J]=gradientDescent(X,y,theta, alpha,num_iterations, epsilon)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
J=zeros(num_iterations,1);
J(1) = computeCost(X, y, theta); % initial cost
e = epsilon + 1;
i = 2;
while e>=epsilon && i<num_iterations 
    for m = 1: size(y,1)
        theta = theta + alpha*(y(m) - (X(m, :).*theta)).*X(m, :); 
    end
    computeCost(X, y, theta)
    J(i, 1) = computeCost(X, y, theta);
    e = J(i-1, 1) - J(i, 1);
    i = i +1;
end

end

