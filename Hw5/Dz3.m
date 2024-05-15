clc
function[x0, y0, l, m] = genToPar(A, B, C);
  l = -B;
  m = A;
  if A != 0;
    y0 = 1;
    x0 = (-B -C) / A;
    return;
  endif;
  if B != 0;
    x0 = 1;
    y0 = (-A -C) / B;
    return;
  endif;

  if A == 0 && B == 0;
    x0 = 0;
    y0 = 0;
    l = 0;
    m = 0;
    return;
  endif;
endfunction;


function[A, B, C] = parToGen(x0, y0, l, m)
  A = m;
  B = -l;
  C = l * x0 - m * y0;
endfunction













A = 2
B = 2
C = 3

disp("           ")

[x0, y0, l, m] = genToPar(A, B, C)
disp("           ")
[A, B, C] = parToGen(x0, y0, l, m)

# 2x + 2y + 3 = 0
# Ax + By + C = 0
# l m = -B A
# x = (-2y -3) / 2
# x = (-By -C) / A
# y = (-Ay -C) / B

