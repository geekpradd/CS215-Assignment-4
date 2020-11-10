rng(4);
k = 1000;
low = 1;
high = 500000;
batch = 1000;
tic

while low<high-1
   m = floor((low+high)/2);
   mid = m;
   p = 0;
   while m>batch
    total_sample = 2*rand(k,min(batch,m-batch),2)-1;
     y = total_sample(:,:,1).^2 + total_sample(:,:,2).^2 <= 1;
    pi_e = single(4*sum(y,2)/batch);
    p = p + (sum(abs(pi_e-pi) <= 0.01,"all"));
    m = m-batch;
   end    
   p = p/k;
   if p >= 0.95
        high = mid;
   else
       low = mid;
   end
   disp(string(mid)+": "+string(p))
   disp("--------------------")
end
toc
disp(m);