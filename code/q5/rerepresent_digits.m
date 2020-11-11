function [reduced, basis]=rerepresent_digits(data, n)
    % the data is stacked columnwise so that every column is an entry
    % we want to reduce the data into n dimensions
    mean_vector = sum(data, 2)/size(data, 2);
    % mean is found by summing the column vectors
    data = data - mean_vector;
    % mean subtraction (needed for covariance)
    covariance = data*data'/size(data, 2); %calculate the covariance matrix

    [V, D] = eig(covariance); 
    %perform eigen value decomposition to get eigen vectors and eigen values

    [~, ind] = sort(diag(D), 'descend');
    % get the sorting order of eigenvalues
    
    VS = V(:, ind); %sort the eigenvectors according to eigenvalues
    basis = VS(:, 1:n); %take first n components
    
    reduced = basis'*data; % this reduces the data in form of coefficients along bases
   % the above vectorised implementation gives us the compressed data.
   % This is because after multiplying as above the value of R_{ij} where R
   % is the reduced data matrix, is the inner product of the ith
   % eigenvector with the jth sample (the jth column in digits).
   % Thus in reduced data the jth column contains the 84 inner products of
   % the jth sample with the eigenvectors which is our compressed
   % represention.
   % this gives the representation of image in n coordinates

end