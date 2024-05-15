clc;
warning off;
syms t;
x = (1 - sqrt(t))^(1/3);
y = sqrt(1-(t)^(1/3));
dx = diff(x, t);
dy = diff(y, t);
dxdy = diff(simplify(dy/dx), t);
dx2dy = simplify(dxdy/dx);
ans = double(subs(dx2dy, t, 0.5))
