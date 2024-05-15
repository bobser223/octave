
clc;
warning off;


function rank = findMinorRank(matrix)
  n = size(matrix, 1);
  tol = 1e-10;

  for k = n:-1:1
    comb = nchoosek(1:n, k);
    for i = 1:size(comb, 1)
      for j = 1:size(comb, 1)
        subMatrix = matrix(comb(i,:), comb(j,:));
        if abs(det(subMatrix)) > tol
          rank = k;
          return;
        endif
      endfor
    endfor
  endfor

  rank = 0;
endfunction

function result = oneNum(column)
  counter = 0;
  [m, n] = size(column);
  for i = 1:m
    if column(i,1) ~= 0;
      counter++;
    endif
  endfor
  if counter == 1;
    result = 1;
    return
  endif
  result = 0;
endfunction;

function basisSize = findBasisSize(B)
    A = rref(B);
    basisSize = 0;
    [m, n] = size(A);
    for j = 1:n
        if oneNum(A(:, j)) == 1
            basisSize++;
        endif
    endfor
endfunction


A = [3 -5 2 7 -1; 3 8 1 2 5; 7 -8 4 2 6; 2 19 0 9 3; -18 6 -9 6 -25];


minorRank = findMinorRank(A);
basisSize = findBasisSize(A);
if minorRank == basisSize
  print("Нічого собі, ранги однакові, хто б міг подумати")
endif

