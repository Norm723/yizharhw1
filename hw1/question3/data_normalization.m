function [Xnorm, Xavg, Xdev] = data_normalization(X)
%data_normalization Summary of this function goes here
%   usage - [X] = data_normalization(X)

Xavg = mean(X);
Xdev = std(X);

Xnorm = (X-Xavg)./Xdev;
end

