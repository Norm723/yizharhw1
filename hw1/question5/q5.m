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
%using linear model with transform of output
X = [ones(samples,1) x];
theta_analytical = (X'*X)^(-1)*X'*y;
plot(x ,X*theta_analytical);
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
hold off

%% 3 predict the number of transistors in 2018
predict=[1 2018]*theta_analytical;
fprintf('The predicted number of transistors in 2018 is is %i \n', predict);