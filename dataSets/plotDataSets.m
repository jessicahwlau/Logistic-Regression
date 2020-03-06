
% This script plots the different training datasets.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% For the first two datasets, the exemplars of each class are 
%  in separate files
load generic1.mat
figure(1); clf; hold on;
plot(c1_train(1,:),c1_train(2,:),'ro')
plot(c2_train(1,:),c2_train(2,:),'bx')
legend({'class 1','class 2'});

load generic2
figure(2); clf; hold on;
plot(c1_train(1,:),c1_train(2,:),'ro')
plot(c2_train(1,:),c2_train(2,:),'bx')
legend({'class 1','class 2'});

disp('hit return to continue');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% For the fruit dataset, the class label (the type of fruit) is given by
% the variable "target_train".  The ith training exemplar is an orange
% if target_train(1,i) == 1, and it is a lemon if target_train(2,i) == 1.
% The inputs are height and width, in cm, to the nearest mm.

load('fruit_train');
idx_orange=[find(target_train(2,:)==1)];
idx_lemons=[find(target_train(1,:)==1)];
figure(3); clf; hold on;
plot(inputs_train(1,idx_orange),inputs_train(2,idx_orange,:),'ro')
plot(inputs_train(1,idx_lemons),inputs_train(2,idx_lemons,:),'gx')
legend({'oranges','lemons'});

disp('hit return to continue');
pause;

