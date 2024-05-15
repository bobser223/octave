clc;
warning off;
function result = printSquares(a, b);
  z = complex(a, b);
  r = abs(z);
  fi = arg(z);
  for n = 1:100;
    a2 = r.^n .* cos(n .* fi);
    b2 = r.^n .* sin(n .* fi);
    z2 = complex(a2, b2);
    plot(z2);
    hold on;
  endfor
  pause(3);
  hold off;
  close;
  result = 0;
endfunction




a = 0.9
b = 0.5
result = printSquares(a, b)

a = 0.9
b = 0.4
result = printSquares(a, b)
