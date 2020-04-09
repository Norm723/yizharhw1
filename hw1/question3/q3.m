%% question 3
clear, clc,  close all
data=load('houses.txt');
samples = size(data, 1); %number of samples
params = size(data, 2) - 1; %size without y value
x = data(:, 1:params);
y = data(:, params+1);

%% 1 get the normalized data and find optimal theta with gradient descent
[norm, avg, dev] = data_normalization(x);
X = [ones(samples,1) norm]; %add x0
num_iterations=2000;
alpha=0.01;
theta=zeros(params+1,1); %number of params + theta0, could also have done size(X, 2)
% run gradient descent
[theta,J]=gradientDescent(X,y,theta, alpha,num_iterations, 0);
% print theta to screen
fprintf('Theta found by gradient descent: ')
fprintf('%f %f \n', theta(1), theta(2));
% plot the linear fit
%figure(1), plot(X(:,2), X*theta, '-b')
%legend('Training data', 'Linear regression (gd)')
%hold off;

%% 2
newHouse = [1800, 5];
newNorm = data_normalization(newHouse);
predict1=[1 newNorm]*theta;
fprintf('For House with 1800 sf and 5 rooms,the predicted cost is $%f \n', predict1);