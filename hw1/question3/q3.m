%% question 3
clear, clc,  close all
data=load('houses.txt');
samples = size(data, 1); %number of samples
params = size(data, 2) - 1; %size without y value
x = data(:, 1:params);
y = data(:, params+1);
%% 1
norm = data_normalization(x);