clc;
warning off;



function solution = rank(matrix);
  solution = 0;
  gaused_matrix = rref(matrix);
  for i = 1:5
    if gaused_matrix(i, i) == 1;
      solution = solution + 1;
    endif
  endfor
endfunction

function solution = MLNZ(matrix);
  solution = [];
  index_list = [];
  gaused_matrix = rref(matrix);

  for i = 1:5
    if gaused_matrix(i, i) == 1;
      index_list = [index_list, i];
    endif
  endfor
  if length(index_list) == 0
    solution = "unfotunately, there's no linearly ind. vectors, I dont know how it happend, maybe your import is incorrect";
    return;
  endif
  solution = matrix(:, index_list);
endfunction



A = [3 -5 2 7 -1; 3 8 1 2 5; 7 -8 4 2 6; 2 19 0 9 3; -18 6 -9 6 -25]



mlnz = MLNZ(A)
rank = rank(A)





