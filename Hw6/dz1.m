clc
fi = 0: pi/1000 : pi;
a = input("a = ");


rho = ((2 * a.^2)*(cos(2*fi))) .^ 0.5;

polar(fi,rho,"g");
grid on;


