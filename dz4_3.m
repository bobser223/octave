
clc
tic
warning off
for m = 1:10^3
  result = 0;
  for n = 2:m;
    result += isPrime(n);
  endfor;
  disp(result);
endfor
toc

