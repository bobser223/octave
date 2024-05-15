pkg load symbolic

clc;
warning off;

n = 8;
b = 1;
a = 0;

h = (b - a) / n;
x = linspace(a, b, n+1);
fx = @(x) e.^(x.^2);

integrandValues = fx(x);
sumIntegrand = sum(integrandValues) - (integrandValues(1) + integrandValues(end))/2;
result = h * sumIntegrand

syms x;
fy = -e.^(x.^2);

fy1 = diff(fy, x);
fy2 = @(x) fy1;
[xmax, ymax] = fminbnd(fy2, a, b);


M = xmax;

fluff = ((b - a)^3 * M)/(12 * n.^2)


integral(fx, 0, 1)



x = 0:0.1:1;
y = e.^(x.^2);
trapz(x, y);
