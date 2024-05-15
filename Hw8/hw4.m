clc;
warning off;

function [rootss, per_roots] = roots(n);
  rootss = [];
  per_roots = [];
  for k = 0:n-1;
    a = cos(2*pi*k/n);
    b = sin(2*pi*k/n);
    z = complex(a, b);
    rootss = [rootss, z];
    if gcd(k, n) = 1;
      per_roots = [per_roots, z];
    endif;
  endfor;

n = 10
[rootss, per_roots] = roots(n)
