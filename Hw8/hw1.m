clc;
warning off;
function solutions = Equation(a, b, c, d, e);
  c = [a b c d e];
  solutions = roots(c);

endfunction;


a = 2
b = 3
c = 4
d = -10
e = 7

Equation(a, b, c, d, e)
