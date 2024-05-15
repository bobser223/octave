clc
format long
f = fopen('output.txt', 'at');
for x = 1:20
  c = 1
  for i = 1:x
    c = c * i
  end

  fprintf(f, 'factorial of %d = %d\n', x, c);
end
fclose(f);

