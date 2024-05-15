clc;
warning off;

fx = @(x) ((x-3).^3) .* exp(abs(x));
neg_fx = @(x) -((x-3).^3) .* exp(abs(x));
[xmin, ymin] = fminbnd(fx, -1, 4)
[xmax, ymin] = fminbnd(neg_fx, -1, 4)
x = -1:0.1:4;
y = fx(x);
plot(x, y);

