clc
format long
f = fopen('output.txt', 'at');
for x = 0:20
  c = factorial(x);
  fprintf(f, 'factorial of %d = %d\n', x, c);
end
fclose(f);



