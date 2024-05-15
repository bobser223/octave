clc
function[fi, r] = decToPol(x, y);
  fi = arctan(y/x);
  r = (x.^2+ y.^2).^0.5;
endfunction;

x = 2
y = 3


[fi, r] = decToPol(x, y)

[fi, r] = dec2pol(x, y)
