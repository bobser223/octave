clc

function[cross, angle] = line(x, a1, b1, c1, a2, b2, c2);
  if b1 ~= 0;
    y1 = (c1 - a1.*x) ./ b1;
    plot(x, y1);
    axis('equal');
    xlabel('X');
    ylabel('Y');
    grid on;
    hold on;
  elseif a1 ~= 0;
    x1 = -c1./a1;
    y1 = -100:0,01:100;
    axis('equal');
    xlabel('X');
    ylabel('Y');
    grid on;
  endif;
  if b2 ~= 0;
    y2 = (c2 - a2.*x) / b2;

    plot(x, y2);
    hold on;
  elseif a2 ~= 0;
    x2 = -c1./a1;
    y2 = -100:0,01:100;

    plot(x2, y2);
    hold on;
  endif
  if a1/a2 == b1/b2 == c1/c2;
    cross = "прямі паралельні";
    angle = "перетину немає";
  else
    l1 = -a1 / b1;
    l2 = -a2 / b2;

    m1 = -c1 / b1;
    m2 = -c2 / b2;

    x_c = (m2 - m1) / (l1 - l2);
    y_c = l1 * x_c + m1;
    cross = [x_c, y_c];

    angle = acos(abs(a1.*a2 + b1.*b2 + c1.*c2) ./ ((a1.^2 + b1.^2 + c1.^2).^0.5 * (a2.^2 + b2.^2 + c2.^2).^0.5));

  endif;

endfunction;

x = -100:0.1:100;
a1 = 2;
b1 = 3;
c1 = 4;

a2 = 5;
b2 = 7;
c2 = 9;

[cross, angle] = line(x, a1, b1, c1, a2, b2, c2)


