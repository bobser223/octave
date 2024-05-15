pkg load symbolic;
clc;
syms x;

limit(sin(x)/abs(x),x,0, "right")
limit(sin(x)/abs(x),x,0, "left")



