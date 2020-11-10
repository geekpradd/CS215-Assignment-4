rng(4);
% values of N to be tested on
N = [10 10^2 10^3 10^4 10^5 10^6 10^7 10^8];
% number of samples to be processed simultaneously
batchSize = 1000000;
% Loop through N
for i=1:length(N)
   % get the ith value in N
   n = N(i);
   numBatches = ceil(n/batchSize);
   count = 0;
   % sample n random points. This is equal to n*2 random variables.
   parfor j=0:numBatches-1
       % sample random points
       sample = 2*rand(min(batchSize,n-j*batchSize),2)-1; 
       % sample(:,1).^2 + sample(:, 2).^2 is the distance of the point from
       % origin. We compare it to 1 to get if it lies inside the circle or not.
       % sample(:,1).^2 + sample(:, 2).^2 <=1 will be an array of size same as sample and
       % its ith element is 1 if the ith sample point lies inside the circle
       % otherwise 0
       % To get the number of points inside circle we sum over this.
       count = count + sum(sample(:,1).^2 + sample(:, 2).^2 <= 1);  
   end 
   % get the estimated value of pi
   pi = single(4*count/n);
   disp("Estimate at n = " + string(n) + " is " + string(pi));
end