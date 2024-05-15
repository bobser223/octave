clc
format long
f = fopen("praska.txt", "at");
x = [1:10];
fprintf(f, "%d\n", x(:))
fclose(f)
b = [1, 2, 3, 4]
c = [1 2 3 4 ]
d = [1; 2; 3; 4]
e = [1, 2, b]
g = 1:2:13
i = 0:0.2:1

x = -10:0.000001:10
f = x.*x + sin(x)
plot(x, f)
