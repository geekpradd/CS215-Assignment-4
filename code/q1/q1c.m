rng(4);
% values of N to be tested on
N = [10 10^2 10^3 10^4 10^5 10^6 10^7 10^8];

% Loop through N
for i=1:length(N)
   % get the ith value in N
   n = N(i);
   % sample n random points. This is equal to n*2 random variables.
   sample = single(2*rand(n,2)-1);
   % sample(:,1).^2 + sample(:, 2).^2 is the distance of the point from
   % origin. We compare it to 1 to get if it lies inside the circle or not.
   % sample(:,1).^2 + sample(:, 2).^2 <=1 will be an array of size n and
   % its ith element is 1 if the ith sample point lies inside the circle
   % otherwise 0
   % To get the number of points inside circle we sum over this.
   count = single(sum(sample(:,1).^2 + sample(:, 2).^2 <= 1));  
   % get the estimated value of pi
   pi = single(4*count/n);
   disp("Estimate at n = " + string(n) + " is " + string(pi));
end