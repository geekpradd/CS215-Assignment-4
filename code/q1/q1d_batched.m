rng(4);
% number of samples to process simultaneously
batchSize = 10000;
%highest value of M
high = 500000;
%lowest value of M
low = 0;
% number of times to repeat experiment for a given M 
k = 1000;

% using binary search to find the correct value of M
% although the probability that we will get wont be sorted exactly but
% would be increasing in general. So, this would give a good estimate of M
while low <high
    %middle value
    mid = floor((low+high)/2);
    % number of times to run the loop
    numBatches = ceil(mid/batchSize);
    % stores how many 1 
    y=0;
    parfor i = 0:numBatches-1
        % sample random numbers from uniform distribution
        % at each step, we get a new batch for each experiment
        % so, k*batchSize*2 variables are sampled
        sample = 2*rand(k,min(batchSize,mid-i*batchSize),2)-1;
        % for each experiment, calculating how many samples are within a
        % radius of 1 from origin
        % sample(:,:,1).^2 + sample(:,:,2).^2 finds the distance of point
        % from origin and then we compare it with 1. then we sum over a
        % single experiment to get the number of favourable samples 
        y = y + sum(sample(:,:,1).^2 + sample(:,:,2).^2 <=1,2);
    end
    % for each experiment, calculating the value of pi estimated
    pi_e = 4*y/mid;
    % probability that the experimentally determined value is within a
    % range of 0.01
    p = sum(abs(pi_e-pi) <= 0.01,"all")/k;
    % applying the recursive step for binary search
    if p >= 0.95
        high = mid;
    else
       low = mid+1;
    end
   %display the value of M and sample probability
    disp(string(mid)+": "+string(p))
    disp("--------------------")
end
% if no p=0.95, the algorithm may return M for which p is just lower or
% just higher, So ensuring p is higher
if p<0.95
    mid=mid+1;
end
disp("found value of m: " + num2str(mid));