function [bases, diagonal] = highest_dimensions(data, n)
    mean = sum(data,2)/size(data,2); %compute the mean
    data = data - mean;  %center the data about mean    
    covariance = data*data'/size(data, 2); %calculate the covariance matrix
    [V, D] = eig(covariance); 
    %perform eigen value decomposition to get eigen vectors and eigen values

    [~, ind] = sort(diag(D), 'descend');
    % get the sorting order of eigenvalues
    
    
    VS = V(:, ind); %sort the eigenvectors according to eigenvalues
    DS = D(ind, ind); %sort the eigen values
    bases = VS(:, 1:n); %take first n components
    
    diagonal = DS(1:n, 1:n); %take first n components
    
end