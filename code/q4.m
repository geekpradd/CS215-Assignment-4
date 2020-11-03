load("mnist.mat");

for d=0:9
   digits = digits_train(:, :, labels_train==d);
   digits = reshape(im2double(digits), [784 size(digits, 3)]);
   
   mean_vector = sum(digits, 2)/size(digits, 2);
   digits = digits - mean_vector;
   
   cov = digits*digits'/size(digits, 2);
   [V, D] = eig(cov);
   
   [~, i] = sort(diag(D), 'descend');
   V = V(:, i);
   D = D(i, i);
   
   v1 = V(:, 1);
   lambda1 = D(1, 1);
   
   figure(d+1);
   plot(diag(D));
   title(["Eigenvalues for Digit " num2str(d)]);
   
   figure(11+d);
   subplot(1,3,1);
   imagesc(reshape(mean_vector - sqrt(lambda1)*v1,[28 28]));
   title("\mu - sqrt(\lambda_1)*v_1 for " + string(d))
   subplot(1,3,2); imagesc(reshape(mean_vector,[28 28]));
   title("\mu for " + string(d))
   subplot(1,3,3); imagesc(reshape(mean_vector + sqrt(lambda1)*v1,[28 28]));
   title("\mu + sqrt(\lambda_1)*v_1 for " + string(d))
end
