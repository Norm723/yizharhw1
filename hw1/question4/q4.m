%q4
%% 1 plot the data
clear, clc,  close all
data=csvread('kleibers_law_data.csv',1,0);
samples = size(data, 1); %number of samples
params = size(data, 2) - 1; %size without y value
x = log(data(:, 1:params));
y = log(data(:, params+1));
m=samples; % number of training examples
% plot the data
figure(1)
plot(x,y,'k.','MarkerSize', 8);
xlabel('log of mass'), ylabel('log of metabolic rate')
title('log of mass vs. log of metabolic rate'), grid, hold on % overlay data

%% 2 and 3 linear model and non-linear function
%log(htheta) = theta0+log(X)*theta;
%htheta = exp(log_htheta);
%can also be expressed as: htheta = theta0*year^theta1 
%so we can find optimal theta by looking at the linear relationship between
%the logs and then calculting our prediction by taking e to the power of
%our hypotheis function

%for testing the model is ok
X = [ones(samples,1) x];
theta_analytical = (X'*X)^(-1)*X'*y;

plot(x ,X*theta_analytical, 'g');

%X = [ones(samples,1) exp(x)]; %add x0 and get rid of log
num_iterations=2000;
alpha=0.03;
theta=zeros(params+1,1); %number of params + theta0, could also have done size(X, 2)
% run gradient descent
[theta,J]=gradientDescent(X,y,theta, alpha,num_iterations, 0);
figure(1)
plot(x ,X*theta);
hold off
% print theta to screen
fprintf('Theta found by gradient descent: ')
fprintf('%f %f \n', theta(1), theta(2));

%% 4 predicted calories for a mammal weighing 15 kg
predict1= (exp(theta(1)).*15 .^theta(2))/4.18;
fprintf('predicted calories for a mammal weighing 15 kg is %.2f \n', predict1);

%%5
kilos=(2.5/exp(theta(1))).^(1/theta(2));
fprintf('estimated weight for a mammal that needs 2.5 kJoul per day is : %i kilograms\n',kilos);