% question2
%% 1 load and plot the data
clear, clc,  close all
data=load('faithful.txt');
x=data(:,1); %duration
y=data(:,2); %time to next eruption
m=length(y); % number of training examples
% plot the data
figure(1)
plot(x,y,'rx','MarkerSize', 12);
xlabel('duration of eruption, Minutes'), ylabel('Time until next eruption, Minutes')
title('Duration of Eruption vs. Time to next Eruption'), grid, hold on % overlay data


%% 2 gradient descent
X=[ones(m,1) x]; %add x0
num_iterations=2000;
alpha=0.001;
theta=zeros(2,1);
% run gradient descent
[theta,J]=gradientDescent(X,y,theta, alpha,num_iterations, 0);
% print theta to screen
fprintf('Theta found by gradient descent: ')
fprintf('%f %f \n', theta(1), theta(2));
% plot the linear fit
figure(1), plot(X(:,2), X*theta, '-b')
legend('Training data', 'Linear regression (gd)')
hold off;

%% 3 Prediction for eruptions of duration 1.5, 3, and 5 minutes respectively
predict1=[1 1.5]*theta;
fprintf('For duration = 1.5 minutes, we predict the next eruption in %f minutes \n', predict1);
predict2=[1 3]*theta;
fprintf('For duration = 3 minutes, we predict the next eruption in %f minutes \n', predict2);
predict3=[1 5]*theta;
fprintf('For duration = 5 minutes, we predict the next eruption in %f minutes \n', predict3);

%% 4 wrote computeCost

%% 5
% Grid for contour plot of gradient descent
theta0=linspace(0, 30, 500);
theta1=linspace(0, 20, 500);
J =zeros(length(theta0),length(theta1));
% a matrix of J values for each theta
for i = 1:length(theta0)
    for j = 1:length(theta1)
        thetamatrix = [theta0(i); theta1(j)];
        J(i,j) = computeCost(X, y, thetamatrix);
    end
end
% contour plot using a logarithmic scale
figure(3)
contour(theta0, theta1, J, logspace(-2, 7, 35))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'bx', 'MarkerSize', 5, 'LineWidth', 2);
% theta(1) and theta(2) are the values computed by gradient descent

%% 6 see pdf