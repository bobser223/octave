pkg load symbolic;

clc;
warning off;

#варіант 1
syms x;
fx = ((1 + x).^(1/x) - exp(1));
gx = x;
dxfx = diff(fx);
dxgx = diff(gx);
subs(simplify(dxfx/dxfx), 0);

syms x;
fx = x - 1 - log(x);
gx = (x-1)*log(x);
dxfx = diff(fx);
dxgx = diff(gx);
subs(simplify(dxfx/dxfx), 1)

# варіант 2
syms x;

limit((((1 + x).^(1/x) - e)/x),x,0)
limit(((x - 1 - log(x))/((x-1)*log(x))),x,1)

#варіант 3

function limit_a = approx_limit_a()
  x_values = logspace(-8, 0, 100);
  limit_values = (1 + x_values).^(1 ./ x_values) - e;
  limit_a = limit_values(end);
endfunction


function limit_b = approx_limit_b()
  x_values = linspace(0.999, 1.001, 100);
  limit_values = (x_values - 1 - log(x_values)) ./ ((x_values - 1) .* log(x_values));
  limit_b = limit_values(end);
endfunction


disp(approx_limit_a());
disp(approx_limit_b());

