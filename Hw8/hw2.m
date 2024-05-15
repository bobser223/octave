clc
warning off
function r, fi = al2trig(a, b);
  z = complex(a, b);
  r = abs(z);
  fi = arg(z);
endfunction;


a = 2
b = 3
r, fi = al2trig(a, b)

