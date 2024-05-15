clc
x_plus = 0.000001:0.01:3;
x_minus = -3:0.01:0;
x_normal = -3:0.01:3;

y = sin(x_normal) .* exp(2 * x_normal);
g_plus = (2 * x_plus) + (sin(x_plus).^2 ./ (2 + x_plus));
g_minus = (1 + x_minus.^2) ./ sqrt(1 + x_minus.^4);

plot(x_normal, y)
hold on;
plot(x_plus, g_plus)
plot(x_minus, g_minus)

