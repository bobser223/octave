clc
function result = pi(n)
  result = sum(isprime(1:n))

endfunction

n = 1000;
x = 1:n;
disp(pi(x))

