rng(4);
k = 1000;
low = 1;
high = 500000;
tic

while low<high-1
   m = floor((low+high)/2);
   total_sample = 2*rand(k,m,2)-1;
   y = total_sample(:,:,1).^2 + total_sample(:,:,2).^2 <= 1;
   pi_e = single(4*sum(y,2)/m);
   p = sum(abs(pi_e-pi) <= 0.01,"all")/k;
   if p >= 0.95
        high = m;
   else
       low = m;
   end
   disp(string(m)+": "+string(p))
   disp("--------------------")
end
toc
disp(m);