clc;

function det = determinant(matrix)
  det = 0;
  for i = 1:4
    minor = matrix([1:i-1, i+1:4], [1:i-1, i+1:4]);
    cofactor = (-1)^(1+i) * det3(minor);
    det = det + matrix(1,i) * cofactor;
  end
end

function det = det3(matrix)
  det = matrix(1,1) * (matrix(2,2)*matrix(3,3) - matrix(2,3)*matrix(3,2)) ...
      - matrix(1,2) * (matrix(2,1)*matrix(3,3) - matrix(3,1)*matrix(2,3)) ...
      + matrix(1,3) * (matrix(2,1)*matrix(3,2) - matrix(2,2)*matrix(3,1));
end

function result = zero_chek(vector)
  result = 0;
  for i = 1:4;
    if vector(i) ~= 0;
      result = 1;
    endif
  endfor;
endfunction


function result = particular_sol(matrix, addition)
  result = [0 0 0 0];
  for i = 1:4;
    if matrix(i, i) == 1;
      result(i) = addition(i);
    endif

  endfor
endfunction;

function result = FSR(matrix);
  result = [[0 0 1 0 ]; [0 0 0 1]];
  result(1, 1) = (-matrix(1, 3));
  result(1, 2) = (-matrix(2, 3));
  result(2, 1) = (-matrix(1, 4));
  result(2, 2) = (-matrix(2, 4));

endfunction;



function [mat, add] = gaus_ilumination_colhoz_calculator(matrix, addition);
  for i = 1:4
    if zero_chek(matrix(i,:)) == 0;
      continue;
    endif;
      for j = i+1:4
          scalar = matrix(j,i) / matrix(i,i);
          matrix(j,:) = matrix(j,:) - scalar * matrix(i,:);
          addition(j) = addition(j) - scalar * addition(i);
      endfor;
  endfor;
  for j = 1:4
      for i = j+1:4
          if zero_chek(matrix(i,:)) == 0;
              continue;
          endif;
          scalar = matrix(j,i) / matrix(i,i);
          matrix(j,:) = matrix(j,:) - scalar * matrix(i,:);
          addition(j) = addition(j) - scalar * addition(i);


      endfor;
  endfor;
  for i = 1:4
    if matrix(i,i) == 0;
      continue;
    endif;
      addition(i) = addition(i) ./ matrix(i,i);
      matrix(i,:) = matrix(i,:) ./ matrix(i,i);
  endfor;
  mat = matrix;
  add = addition;

endfunction;

function result = solve(matrix, addition)
  [mat, add] = gaus_ilumination_colhoz_calculator(matrix, addition);
  if determinant(matrix) ~= 0;
    result = add;
    return;
  endif;
  particular_solution = particular_sol(mat, add);
  fsr = FSR(mat);
  particular_solution_str = num2str(particular_solution(1, :));
  fsr1_str = num2str(fsr(1, :));
  fsr2_str = num2str(fsr(2, :));
  fprintf("(%s) + t1(%s) + t2(%s)\n", particular_solution_str, fsr1_str, fsr2_str);
  result = particular_solution;

endfunction

matrix = [1 1 -6 -4; 3 -1 -6 -4; 2 3 9 2; 3 2 3 8];
addition = [6 2 6 -7];


matrix = [2 7 3 1; 1 3 5 -2; 1 5 -9 8; 5 18 4 5];
addition = [5 3 1 12];

result = solve(matrix, addition);

