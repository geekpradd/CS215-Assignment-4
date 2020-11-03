function [dimensions, bases] = highest_dimensions(data, n)
    covariance = data*data'/size(data, 2);
    [V, D] = eig(covariance);
    
    [~, ind] = sort(diag(D), 'descend');
    
    dimensions = ind(1:n);
    VS = V(:, ind);
    bases = V(:, 1: n);
    
end