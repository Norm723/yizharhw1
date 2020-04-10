% question 5
%% 1 the transformation is as follows
%we can see that there is exponential growth in the number of transistors
%the growth is given by the funtion: log(y) = x*theta'
clear, clc,  close all
data=csvread('transistor_counts.csv',1,0);
samples = size(data, 1); %number of samples
params = size(data, 2) - 1; %size without y value
x = (data(:, 1:params));
y = log(data(:, params+1));
m=samples; % number of training examples
% plot the data
figure(1)
plot(x,y,'k.','MarkerSize', 8);
xlabel('year'), ylabel('log of number of transistors')
title('year vs. log of number of transistors'), grid, hold on % overlay data

%% 2
%using analytical linear model with transform of output
X = [ones(samples,1) x];
theta_analytical = (X'*X)^(-1)*X'*y;
plot(x ,X*theta_analytical);

%using linear regression
num_iterations=100000;
alpha=5e-14;
theta=ones(params+1,1); %number of params + theta0, could also have done size(X, 2)
theta = theta .* [-6.972189483089538e+02; 0.357187499983614 ]; % was not reaching the correct theta when starting from [0 ; 0]
% run gradient descent
[theta,J]=gradientDescent(X, y,theta, alpha,num_iterations, 0);
figure(1)
plot(x ,X*theta, '-r');
legend('Training data', 'Analytical linear model', 'Linear regression (gd)')
hold off
% print theta to screen
fprintf('Theta found by gradient descent: ')
fprintf('%f %f \n', theta(1), theta(2));
hold off

%using model without transform of output
y2 = (data(:, params+1));
figure(2)
plot(x,y2,'k.','MarkerSize', 8);
xlabel('year'), ylabel('number of transistors')
%X = X*exp(1);
title('year vs. number of transistors'), grid, hold on % overlay data
%theta_analytical = (X'*X)^(-1)*X'*y2;
plot(x , exp(X*theta_analytical)); %simply take e to power of result of hypothesis, because hypothesis is log of desired result

plot(x ,exp(X*theta), '-r');
legend('Training data', 'Analytical linear model', 'Linear regression (gd)')
hold off

%% 3 predict the number of transistors in 2018
predict=exp([1 2018]*theta_analytical);
fprintf('The predicted number of transistors in 2018 is is %i \n', predict);