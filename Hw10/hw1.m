clc
warning off

function result = inverse_matrix(matrix);
  iden_m = eye(4);
  for i = 1:4
      div_scalar = matrix(i,i);
      matrix(i,:) = matrix(i,:) / div_scalar;
      iden_m(i,:) = iden_m(i,:) / div_scalar;

      for j = [1:i-1, i+1:4]
          scalar = matrix(j,i);
          matrix(j,:) = matrix(j,:) - scalar * matrix(i,:);
          iden_m(j,:) = iden_m(j,:) - scalar * iden_m(i,:);
      end
  end
  result = iden_m;
end


function result = Auto_check(matrix, addition, solution);
  result = "solution of my calculator is correct, to see it look apper";
  for i = 1:4;
    sub_result = 0;
    for j = 1:4;
      sub_result = sub_result + matrix(i,j) * solution(j);
    endfor;
    if sub_result != addition(i);
      result = "don't use my solutin it's totaly incorrect"
    endif;
  endfor;
endfunction;

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


function result = Kramer_method(matrix, addition)
  determinant = det(matrix);
  if determinant == 0
    result = "no solution";
    return;
  endif


  for j = 1:4
    m = matrix;
    m(:, j) = addition;
    d(j) = round(det(m));
  endfor

  result = d / determinant;
endfunction

function result = alg_trans(matrix, addition);
  add = [0;0;0;0];
  for i = 1:4;
    add(i,1) = addition(i);
  endfor;
  inv_m = inverse_matrix(matrix);
  result = rat(inv_m * add);
endfunction





matrix = [1 1 -6 -4; 3 -1 -6 -4; 2 3 9 2; 3 2 3 8];
addition = [6 2 6 -7];

solution = [0, 0, 0];
disp("                  ")
disp(gaus_ilumination_colhoz_calculator(matrix, addition));
disp("                  ")
disp(Auto_check(matrix, addition, gaus_ilumination_colhoz_calculator(matrix, addition)))
disp("                  ")
disp("                  ")
result = Kramer_method(matrix, addition)
disp("                  ")
disp("                  ")
result = inverse_matrix(matrix)
disp("                  ")
disp("                  ")
result = alg_trans(matrix, addition)




