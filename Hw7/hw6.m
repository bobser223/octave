clc

function result = resCong(a, b, n);
  [g, l, m] = gcd(a, n);
  if fix(b / g) ~= b / g;
    result = "розвязків немає";
    return;
  endif;
  result = [];
  x0 = (b / g) * l;
  for i = 1:g-1;
    sol = x0 + (i.*n)/g;
    result = [result, sol];
  endfor;

endfunction;

a = 21
b = 49
n = 28

result = resCong(a, b, n)


