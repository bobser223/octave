clc;
warning off;
function result = abraKadabra(xstep, ystep, deg, n);
  numbers = [];
  for x = -10:xstep:10;
    for y = -10:ystep:10;
      z = complex(x, y);
      numbers = [numbers, z];
      if mod(round(abs(z)^deg), n) == 0;
        plot(z);
        hold on;
      endif
    endfor;
  endfor;
  result = numbers;
endfunction

xstep = 0.1
ystep = 0.1
deg = 2
n = 2
result = abraKadabra(xstep, ystep, deg, n)
