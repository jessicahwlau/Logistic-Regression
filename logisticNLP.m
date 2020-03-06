

function [ll, g] = logisticNLP(x1, x2, w, lambda)
% [ll, g] = logisticNLP(x1, x2, w, lambda);
% 
% Inputs:
%   x1 - array of exemplar measurement vectors for class 1.
%   x2 - array of exemplar measurement vectors for class 2.
%   w - an array of weights for the logistic regression model.
%   lambda - 1 / variance for an optional Gaussian weight decay 
%            prior on the logistic regression likelihood
%            NOTE: when lambda == 0, do not use a prior
% Outputs:
%   ll - negative log probability (likelihood) for the data 
%        conditioned on the model (ie w).
%   g - gradient of negative log data likelihood
%       (partial derivatives of ll w.r.t. elements of w)


% YOUR CODE GOES HERE.
x1_p = logistic(x1, w);
x2_p = logistic(x2, w);

if ~exist('lambda') || lambda == 0
    ll = -(sum(log(x1_p) + log(1-x2_p)));
    g = x1*(x1_p-1)' + x2*(x2_p-0)';
else
    ll = -sum(log(x1_p) + log(1-x2_p)) + lambda*(w'*w);
    g = x1*(x1_p-1)' + x2*(x2_p-0)' + 2*w*lambda;
end

