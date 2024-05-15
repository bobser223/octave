clc
fi = 0: pi/1000 : 2 * pi;
a = input("a = ");


rho = ((a.^2) * sin(2 * fi)).^0.5;

polar(fi,rho,"g");
grid on;
