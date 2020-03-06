function  w = learnLogisticRegression(x1, x2, lambda)
%
% w = learnLogisticRegression(x1, x2, sigma2)
% Inputs
%   x1  is an array of exemplars from class 1
%   x2  is an array of exemplars from class 2
%   lambda is an optional parameter (1/variance) for 
%          a weight decay regularizer
%
% Output
%   w  is a vector of estimated parameters for the logistic regressor
%

if ~exist('lambda');
  lambda = 0;  % 0 indicates that the prior should not be used
end

%% TODO 1: 
%  Initialize the weights.  This is a vector whose dimension 
%  will depend on the dimension of the training exemplars.

w =  zeros(size(x1,1), 1);

% Set checkGradient to one to (roughly) check whether the gradient is correct.
% Set to zero if you're confident they're correct and you want to skip the check
checkGradient = 1;

%%%% TODO 2: Implement the function, logisticNLP, that takes data x1 and x2
%%%% from classes 1 and 2, and the weight vector w, and returns the negative 
%%%% log likelihood and the gradient of the negative log likelihood.

%%%% Once TODO 1 is complete, and logistic NLP is written, most of code 
%%%% below can remain unchanged, up to the end of the inner loop, but please 
%%%% look at the code to make sure you understand it.

% Initial negative log-likelihood and gradient
[ll,g] = logisticNLP(x1,x2,w,lambda);

% Use finite differences to compare numerical and analytical gradients.
if checkGradient
	g2 = zeros(size(w));
	h = .001;
	for i=1:length(w)
    	w2 = w;
    	w2(i)=w2(i)+h;
    	g2(i) = (logisticNLP(x1,x2,w2) - ll)/h;
	end
	
	disp('Analytic gradient:')
	disp(g)
	disp('Numerical gradient:')
	disp(g2)
	disp('These two should be nearly identical (i.e., within 1%)')
	pause
end

% Initial step-size
step = .001;

% Gradient descent inner-loop
l2 = [];
for t=1:1000
    l2 = [l2;ll];  %keep track of negative log-likelihoods in case you want to plot them
    step = step * 2;
    e = logisticNLP(x1,x2,w-step*g);
    
    if norm(g) < eps
        warning('gradient is zero');
        break;
    end
    if isnan(e) || isinf(e)
        error('nan/inf error');
    end
     
    while (e >= ll) && (step > 0)
        step = step / 2;
        e = logisticNLP(x1,x2,w-step*g);
    end
    if (step <= eps)
		warning('Infinitesimal step')
        fprintf(2,'step = %f\n',step);
        break;
    end
    
    w = w - step*g;
    [ll,g] = logisticNLP(x1,x2,w);
    
    fprintf(2,'step = %d, step = %f, ll=%f\n\r',t,step,ll);
end

return
