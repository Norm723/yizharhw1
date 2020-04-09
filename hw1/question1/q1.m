% question1
%% 1 load and plot the data, taken from class exercise 1
clear, clc,  close all
data=load('Xcricket.mat');
x=data.Xcricket(:,2);
y=data.Xcricket(:,1);
m=length(y); % number of training examples
% plot the data
figure(1)
plot(x,y,'rx','MarkerSize', 12);
xlabel('Ground Temperature,F'), ylabel('frequency,Hz')
title('freq vs. Temp'), grid, hold on % overlay data

%% 2 Analytical linear model
X=[ones(m,1) x]; %add x0
theta_analytical = (X'*X)^(-1)*X'*y;
%figure(2)
%plot(x,y,'rx','MarkerSize', 12);
%xlabel('Ground Temperature,F'), ylabel('frequency,Hz')
%title('freq vs. Temp + linear model from anyalitical computation'), grid, hold on % overlay data
%plot(x ,X*theta_analytical);


%% 3 gradient descent (on-line/stochastic)
% initializations
num_iterations=2500;
alpha=5e-6;
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

%% 4 and 5 Predict frequency values for temperatures of 91,77 and 50 degrees
predict1=[1 91]*theta;
fprintf('For temperature = 91 degrees, we predict a freq of %f Hz \n', predict1);
predict2=[1 77]*theta;
fprintf('For temperature = 77 degrees, we predict a freq of %f Hz \n', predict2);
predict3=[1 50]*theta;
fprintf('For temperature = 50 degrees, we predict a freq of %f Hz \n', predict3);