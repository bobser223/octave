clc;
warning off;

a = 4;
b = 5;

g = @(x) sqrt(1 - (x.^2)/25) .*4
s1 = 2 * integral(g, -b, b)
s_humanal = pi * 4 * 5

g1 = @(x) sqrt(1 - (x.^2)/25) .*4 .* x;
g2 = @(x) (sqrt(1 - (x.^2)/25) .*4).^2;

x0 = (1/s1) * integral(g1, -b, b)
y0 = (1/(s1*2)) * integral(g2, -b, b)

