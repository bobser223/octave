clc;

eps = 10^(-3);
x = 0;
supremum = -Inf;
infinum = Inf;
diff = 1;
n = 0;
max_iter = 500;
while abs(diff) > eps;
  xn = (1 + 2*(-1)^n)/(3+(-1)^n);
  if xn > supremum
    supremum = xn;
  endif
  if xn < infinum;
    infinum = xn;
  endif
  diff = xn - x;
  if n > max_iter
    break
  endif
  n += 1;


endwhile;


disp(supremum)
disp(infinum)


##################################

eps = 10^(-5);
x = 0;
supremum = -Inf;
infinum = Inf;
diff = 1;
n = 0;
max_iter = 500;
while abs(diff) > eps;
  xn = (-1)^n * ((n + 1)/(n+2)) + sin((pi*n)/2);
  if xn > supremum
    supremum = xn;
  endif
  if xn < infinum;
    infinum = xn;
  endif
  diff = xn - x;
  if n > max_iter
    break
  endif
  n += 1;


endwhile;


disp(supremum)
disp(infinum)

