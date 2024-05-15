clc;
x1 = -10:0.1:-1;
x2 = -1:0.1:1;
x3 = 1.1:0.1:10;

y1 = -x1.^2 +1;
y2 = 0 * x2;
y3 = x3.^2 -1 ;

plot(x1, y1);
hold on;
plot(x2, y2);
hold on;
plot(x3, y3);
pause(3)
hold off;
close;


x1 = 0:0.1:0.9;
x2 = 1:0.1:1.9;

y1 = x1.^4 + 3*x1.^2 + 2.^x1;
y2 = x2.^3 + x2 + log(x2);

plot(x1, y1);
hold on;
plot(x2, y2);
pause(3)
hold off;
close;

x1 = -10:0.1:0;
x2 = 0.1:0.1:1;
x3 = 1.1:0.1:10;

y1 = 0 * x1;
y2 = x2.*2;
y3 = x3.^4;

plot(x1, y1);
hold on;
plot(x2, y2);
hold on;
plot(x3, y3);
pause(3)
hold off;
close;

x = -10:0.1:10;
y = abs(abs(x) - 1) -1;
plot(x, y);
pause(3)
hold off;
close;




