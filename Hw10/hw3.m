clc;
warning off;
function result = gaus_ilumination_colhoz_calculator(matrix, addition);
  non_change_matrix = matrix;
  non_change_addition = addition;
  for i = 1:4
      for j = i+1:4
          scalar = matrix(j,i) / matrix(i,i);
          matrix(j,:) = matrix(j,:) - scalar * matrix(i,:);
          addition(j) = addition(j) - scalar * addition(i);
      endfor;
  endfor;
  for j = 1:4
      for i = j+1:4
          scalar = matrix(j,i) / matrix(i,i);
          matrix(j,:) = matrix(j,:) - scalar * matrix(i,:);
          addition(j) = addition(j) - scalar * addition(i);
      endfor;
  endfor;
  for i = 1:4
      addition(i) = addition(i) ./ matrix(i,i);
      matrix(i,:) = matrix(i,:) ./ matrix(i,i);
  endfor;
  result = addition;
endfunction;


function result = polynom(y1, y2, y3, y4, x1, x2, x3, x4);
  matrix = [1 x1 x1.^2 x1.^3; 1 x2 x2.^2 x2.^3; 1 x3 x3.^2 x3.^3; 1, x4, x4.^2, x4.^3];
  addition = [y1 y2 y3 y4];
  coef = gaus_ilumination_colhoz_calculator(matrix, addition);
  fprintf("%d + %d x + %d x^2 + %d x ^3", coef)
  result = coef;
endfunction











y1 = 1;
y2 = 10;
y3 = 13;
y4 = 33;

x1 = -2;
x2 = -1;
x3 = 1;
x4 = 2;
result = polynom(y1, y2, y3, y4, x1, x2, x3, x4);
disp("           ")
disp(result)
