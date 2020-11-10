%Q3(c)
% Load data and scatter plot
load points2D_Set2.mat
scatter(x,y)
hold on

% Finding Mean and subtracting from data
mx = sum(x)/size(x,1);
my = sum(y)/size(y,1);
x = x-mx;
y = y-my;

% Covariance matrix and eigen value decomposition
c = [x'*x , x'*y ; x'*y , y'*y] / size(x,1);
[V, d] = eig(c);
d = diag(d); %converrting the diagonal matrix into a vector

% Getting the direction of maximum variance(as there are only two eigen values we can use a simple if statement instead of argmax)
if d(1) > d(2)
    u =  V(:,1);
else
    u = V(:,2);
end

%Plotting the linear relationship
line(xlim, my+u(2)*(xlim-mx)/u(1) ,'LineWidth',3,'Color','red' );
title("point set 2");
hold off

% Normalised mean square error
disp(sum((y - u(2)*x/u(1)).^2)/(size(x,1)*my*my))
