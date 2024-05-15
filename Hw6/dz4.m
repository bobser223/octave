

function dist = distance(x0, y0, a, b, c);
  dist = abs(a.*x0 + b.*y0 + c) ./ (a.^2 + b.^2).^0.5;
endfunction;

x0 = 2
y0 = 2

a = 1
b = 0
c = -3

dist = distance(x0, y0, a, b, c);

