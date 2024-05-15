pkg load symbolic;
clc;
warning off;
%a

syms x;
fx = sin(x + pi);
for _ = 1:25
  fx = diff(fx, x);
endfor;
ans = double(subs(fx, x, pi/4))

%b

syms x;
fx = 5*log(5*x);
for _ = 1:25
  fx = diff(fx, x);
endfor;
ans = double(subs(fx, x, 1))

%c

syms x;
fx = (1/8)^x;
for _ = 1:25
  fx = diff(fx, x);
endfor;
ans = double(subs(fx, x, 0))
