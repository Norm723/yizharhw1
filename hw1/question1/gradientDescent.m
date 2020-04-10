function [theta,J]=gradientDescent(X,y,theta, alpha,num_iterations, epsilon)
%gradientDescent Summary of this function goes here
%   usage - [theta,J] = gradientDescent(X,y,theta, alpha,num_iterations, epsilon)
J=zeros(num_iterations,1);
J(1) = computeCost(X, y, theta); % initial cost
e = epsilon + 1;
i = 2;
while e>=epsilon && i<num_iterations 
    for m = 1: size(y,1)
        theta = theta + (alpha*(y(m) - (X(m, :)*theta)).*X(m, :))'; 
    end
    J(i) = computeCost(X, y, theta);
    e = J(i-1) - J(i);
    i = i +1;
end

figure(2)
plot(1:num_iterations, J);
xlabel('iterations'), ylabel('J')

end

