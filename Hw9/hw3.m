clc;
counter = 0;
i = 0;
f = 0.005;
while i <= (201*pi / 2) + 0.01;
  x1 = i + 0.005;
  x2 = i - 0.005;
  if (abs(sin(x1)) - (2*x1)/201*pi) * (abs(sin(x2)) - (2*x2)/201*pi) < 0;
    counter += 1;
  endif;

  i += 0.01;
endwhile
disp(counter)
