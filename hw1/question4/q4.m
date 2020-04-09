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

%% 2 linear model
X = [ones(samples,1) x]
theta_analytical = (X'*X)^(-1)*X'*y;
plot(x ,X*theta_analytical);

%% 3
