clc;
warning off;

func = @(x)x.^x;
x0 = 2;

tangent = @(x) gradient(func, x0).*(x - x0) + func(x0);


curr_x = 0.1:0.1:10;

y_func = func(curr_x);

y_tangent = tangent(curr_x)

plot(curr_x, y_func);
hold on;
plot(curr_x, y_tangent)




