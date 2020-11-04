rng(4);
N = [10 10^2 10^3 10^4 10^5 10^6 10^7 10^8];

for i=1:length(N)
   n = N(i);
   sample = 2*rand(n,2)-1;
   count = 0;
   for m=1:n
      if sample(m,1)^2 + sample(m, 2)^2 <= 1 
         count = count + 1; 
      end
   end
   
   pi = single(4*count/n);
   disp("Estimate at n = " + string(n) + " is " + string(pi));
end