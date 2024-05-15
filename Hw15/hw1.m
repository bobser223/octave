clc;
warning off;

n = 100;
b = 1;
a = 0;

h = (b - a) / n;

x = linspace(a, b, n+1);

fx = @(x) 1 ./ (1 + x.^2);

integrandValues = fx(x);

sumIntegrand = sum(integrandValues) - (integrandValues(1) + integrandValues(end))/2;

result = h * sumIntegrand;

disp(result);

integral(fx, 0, 1)

n = 1000;
b = 1;
a = -1;

h = (b - a) / n;

x = linspace(a, b, n+1);

fx = @(x) abs(x);

integrandValues = fx(x);

sumIntegrand = sum(integrandValues) - (integrandValues(1) + integrandValues(end))/2;

result = h * sumIntegrand;

disp(result);

integral(fx, -1, 1)
