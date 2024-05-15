# варіант 1
clc;
warning off;
function result = gaus_ilumination_colhoz_calculator(matrix, addition);
  non_change_matrix = matrix;
  non_change_addition = addition;
  for i = 1:5
      for j = i+1:5
          scalar = matrix(j,i) / matrix(i,i);
          matrix(j,:) = matrix(j,:) - scalar * matrix(i,:);
          addition(j) = addition(j) - scalar * addition(i);
      endfor;
  endfor;
  for j = 1:5
      for i = j+1:5
          scalar = matrix(j,i) / matrix(i,i);
          matrix(j,:) = matrix(j,:) - scalar * matrix(i,:);
          addition(j) = addition(j) - scalar * addition(i);
      endfor;
  endfor;
  for i = 1:5
      addition(i) = addition(i) ./ matrix(i,i);
      matrix(i,:) = matrix(i,:) ./ matrix(i,i);
  endfor;
  result = addition;
endfunction;


function result = polynom(y1, y2, y3, y4, y5, x1, x2, x3, x4, x5);
  matrix = [1 x1 x1.^2 x1.^3 x1.^4; 1 x2 x2.^2 x2.^3 x2.^4; 1 x3 x3.^2 x3.^3 x3.^4; 1 x4 x4.^2 x4.^3 x4.^4; 1 x5 x5.^2 x5.^3 x5.^4];
  addition = [y1 y2 y3 y4 y5];
  coef = gaus_ilumination_colhoz_calculator(matrix, addition);
  fprintf("%d + %d x + %d x^2 + %d x ^3 = %d x^4", coef)
  result = coef;
endfunction











y1 = 0;
y2 = 1;
y3 = 2;
y4 = 1;
y5 = 2;

x1 = 1;
x2 = 2;
x3 = 3;
x4 = 4;
x5 = 5;
result = polynom(y1, y2, y3, y4, y5, x1, x2, x3, x4, x5);
polynom = @(x)(result(1) + result(2).*x + result(3).*x.^2 + result(4).*x.^3 + result(5).*x.^4)
gradient(polynom, 1)
gradient(polynom, 3)

# варіант 2

x = [1, 2, 3, 4, 5];
f = [0, 1, 2, 1, 2];


f_prime_1 = (f(2) - f(1)) / (x(2) - x(1))

f_prime_3 = (f(4) - f(2)) / (x(4) - x(2))







