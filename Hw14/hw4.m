pkg load symbolic;
clc;
warning off;
%a
fx = @(x) 3*x - x.^3
rev_fx = @(x) x.^3 - 3*x
[xmin ymin] = fminbnd(fx, -5, 5)
[xmax ymax] = fminbnd(rev_fx, -5, 5)

x = -5:0.01:5;
y = fx(x);
plot(x, y);
hold on;

x_start = xmin;
y_start = ymin - 10;


x_end = xmin;
y_end = ymin;


u = x_end - x_start;
v = y_end - y_start;


quiver(x_start, y_start, u, v, 1, 'MaxHeadSize', 0.09, 'Color', 'r', 'LineWidth', 1);

x_start = xmax;
y_start = ymax - 10;


x_end = xmax;
y_end = ymax;


u = x_end - x_start;
v = y_end - y_start;

quiver(x_start, y_start, u, v, 1, 'MaxHeadSize', 0.09, 'Color', 'b', 'LineWidth', 1);
hold off;

%b
fx = @(x) 2.^(-x) .* x.^2
rev_fx = @(x) -(2.^(-x) .* x.^2)
[xmin ymin] = fminbnd(fx, -2, 6)
[xmax ymax] = fminbnd(rev_fx, -2, 6)

x = -2:0.01:6;
y = fx(x);
plot(x, y);
hold on;

x_start = xmin;
y_start = ymin - 10;


x_end = xmin;
y_end = ymin;


u = x_end - x_start;
v = y_end - y_start;


quiver(x_start, y_start, u, v, 1, 'MaxHeadSize', 0.09, 'Color', 'r', 'LineWidth', 1);

x_start = xmax;
y_start = ymax - 10;


x_end = xmax;
y_end = ymax;


u = x_end - x_start;
v = y_end - y_start;

quiver(x_start, y_start, u, v, 1, 'MaxHeadSize', 0.09, 'Color', 'b', 'LineWidth', 1);


