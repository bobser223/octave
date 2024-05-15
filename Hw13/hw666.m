clc;

A = [1   0   0   2   2  -2  -2  -4  -1   0;
     0   1   0  -1  -2   2  -1   7   4  -1;
     0   0   1   1   1   0   3  -3  -3   3;
     0   0   0   0   0   0   0   0   0   0;
     0   0   0   0   0   0   0   0   0   0];

function lead_vars = findLeadVars(rref_matrix)
  [m, n] = size(rref_matrix);
  lead_vars = [];
  for i = 1:m
    if rref_matrix(i,i) == 1
      lead_vars = [lead_vars, i];
    endif
  endfor
endfunction

function last_lead_var = findLastLeadVar(rref_matrix)
  [m, n] = size(rref_matrix);
  last_lead_var = 1;
  for i = 1:m
    if rref_matrix(i,i) == 1
      last_lead_var = i;
    endif
  endfor
endfunction

function FSR_matrix = findFSR(B)
  A = rref(B)
  lead_vars = findLeadVars(A);

  B = A(any(A, 2), :);

  [m, n] = size(A);

  free_vars = B(:, (findLastLeadVar(B)+1):end);
  [m1, n1] = size(free_vars);

  FSR_matrix = zeros(n1, n);


  for lineInFSRorColumInFree = 1:n1
    for i = 1:m1
      FSR_matrix(lineInFSRorColumInFree, i) = free_vars( i, lineInFSRorColumInFree);
    endfor
  endfor

  j = 1;
  for i = m1+1:n
    FSR_matrix(j, i) = 1;
    j++;
  endfor

endfunction

FSR_matrix = findFSR(A)

