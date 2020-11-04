function [bases, diagonal] = highest_dimensions(data, n)
    covariance = data*data'/size(data, 2);
    [V, D] = eig(covariance);
    
    [~, ind] = sort(diag(D), 'descend');
    
    VS = V(:, ind);
    DS = D(ind, ind);
    bases = VS(:, 1:n);
    
    diagonal = DS(1:n, 1:n);
    
end