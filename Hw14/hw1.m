pkg load symbolic;
clc;
warning off;
syms x;
fx = x^(1/3);
fxdx = diff(fx, x);

func_fx = @(x) double(subs(fx, x));
func_fxdx = @(x) double(subs(fxdx, x));
ans = func_fx(8) + func_fxdx(0.04)


syms x;
fx = atan(x);
fxdx = diff(fx, x);

func_fx = @(x) double(subs(fx, x));
func_fxdx = @(x) double(subs(fxdx, x));
ans = func_fx(1) + func_fxdx(0.05)
