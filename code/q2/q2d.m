rng(5);
C = [1.6250 -1.9486; -1.9486 3.8750];
MU = [1 2]';
[V,D] = eig(C);

A = V*(D^0.5);

ns = [10 10^2 10^3 10^4 10^5];
%same as q2bc.m
for k = 1:length(ns)
    n = ns(k);
    standard_sample = randn(2, n); % standard sample is 2xN matrix where every column is a sample
    sample = MU + A*standard_sample;
    % above transformation gives a 2xN matrix where every column 
    % is  a sample from our desired multivariate gaussian
    % Note that MU is getting broadcasted.
    
    mean_vector = [0 0]';
    for l=1:n
       mean_vector = mean_vector + sample(:, l); % mean can be found using sum
       % but we have been asked to use eig and randn only
    end
    mean_vector = mean_vector/n;

    sample = sample - mean_vector; % mean subtraction from sample to center
    current_covariance = sample*sample'/n;
    % vectorised implementation for getting sample covariance
    
    [v,d] = eig(current_covariance); % this gives the eigenvalues and eigenvectors
    % of the sample covariance which we will need to draw the directions of
    % maximal variance (along the eigenvector)
    
    figure;
    
    sample = sample + mean_vector;
    % adding back the mean_vector to get the original sample back
  
    scatter(sample(1, :), sample(2, :)); % scatter plot
    title("Scatter plot with N = " + string(n) + " samples ");
    axis equal;
    
    terminal_one = mean_vector + d(1,1)*v(:, 1); % this is the end point
    % of the first line that we will draw, along the first eigenvector
    % with length equal to first eigenvalue
    terminal_two = mean_vector + d(2,2)*v(:, 2);
    % same for the second line
    
    % below commands draw the lines
    line([mean_vector(1) terminal_one(1)], [mean_vector(2) terminal_one(2)], 'Color', 'r', 'LineWidth', 1.5);  
    line([mean_vector(1) terminal_two(1)], [mean_vector(2) terminal_two(2)], 'Color', 'r', 'LineWidth', 1.5);

end