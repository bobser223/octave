pkg load symbolic;
clc;
syms x;

limit((x^3 - 2*x^2 - 4*x + 8) / (x^4 - 8*x^2 + 16), x, 2)

limit((x^2 - x - 2)^20/(x^3 - 12*x + 16), x, 2)

limit((sqrt(1 + tan(x)) - sqrt(1 + sin(x)))/x^3,x,0)

limit(tan(x)^(tan(2*x)),x,pi/4)
