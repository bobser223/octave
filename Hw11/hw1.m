pkg load symbolic;
clc;
syms n;
#a
lim = limit(n^2 / ((n+1)^3 - n^3),n, inf)


epsilon = 10^(-13);
# якщо 10^-5 то результати дуже не точні, тому поставив -13

n = 0;
xn_0 = 0;
xn_1 = 0;
diff = 1;

while abs(diff) > epsilon
  n += 1;
  xn_1 = n^2 / ((n+1)^3 - n^3);
  diff = xn_1 - xn_0;
  xn_0 = xn_1;
endwhile;

fprintf("limit = %d \n", xn_1);
fprintf("n = %d \n", n);



#b
syms n;
limit(1 - 1/(n + 1),n, inf)



n = 0;
xn_0 = 0;
xn_1 = 0;
diff = 1;

while abs(diff) > epsilon
  n++;
  xn_1 = 1 - 1/(n + 1);
  diff = xn_1 - xn_0;
  xn_0 = xn_1;
endwhile;
fprintf("limit = %d \n", xn_1)
fprintf("n = %d \n", n)


