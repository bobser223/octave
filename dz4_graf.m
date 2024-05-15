clc
function result = pi(n);
  result = sum(isprime(1:n));
endfunction;


n = 1000;
x = 2:n;
func_pi = arrayfun(@pi, x);
func_ln = n ./ log(n);

plot(x, func_pi);
hold on;
plot(x, func_ln);
