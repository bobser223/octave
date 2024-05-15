clc;

epsilon = 10^(-3);
dx = 0.1;
x0 = 0;
xn_0 = 0;
xn_1 = 0;
diff = 1;

while abs(diff) > epsilon
  xn_1 = (((asin(x0 + dx))/(sqrt(1 - (x0 + dx).^2)) + (1/2) * log((1 - x0 - dx)/(1+ x0 + dx)))-((asin(x0))/(sqrt(1 - (x0).^2)) + (1/2) * log((1 - x0)/(1+ x0))) )/dx;
  diff = xn_1 - xn_0;
  xn_0 = xn_1;
  dx = dx/2;
endwhile;

fprintf("limit = %d \n", xn_1);
fprintf("n = %d \n", dx);



dx = 0.1;
x0 = 1;
xn_0 = 0;
xn_1 = 0;
diff = 1;

while abs(diff) > epsilon
  xn_1 = (sqrt(x0 + dx + sqrt(x0 + dx + sqrt(x0 + dx))) - (sqrt(x0 + sqrt(x0 + sqrt(x0)))))/dx;
  diff = xn_1 - xn_0;
  xn_0 = xn_1;
  dx = dx/2;
endwhile;

fprintf("limit = %d \n", xn_1);
fprintf("n = %d \n", dx);

gradient(@(x)(sqrt(x + sqrt(x + sqrt(x)))), 1)
