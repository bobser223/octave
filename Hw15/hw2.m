pkg load symbolic

clc;
warning off;

f = @(x) sqrt(1 - x.^2)
g = @(x) x.^2 - 1

syms x;
sol = solve(sqrt(1 - x.^2) - x.^2 + 1 == 0, x);
if sol(1) > sol(2)
  a = double(sol(2))
  b = double(sol(1))
else
  b = double(sol(2))
  a = double(sol(1))
endif;


c = (a + b) / 2

if f(c) > g(c);
  fg = @(x) sqrt(1 - x.^2) - (x.^2 - 1)
else
  fg = @(x) (x.^2 - 1) - sqrt(1 - x.^2)
endif;
integral(fg, a, b)
