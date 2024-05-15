clc;
warning off;

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
function solution = findUnionBasis(U, V)
  matrix = [U, V];
  solution = [];
  index_list = [];
  rref_matrix = rref(matrix);

  for i = 1:5
    if rref_matrix(i, i) == 1;
      index_list = [index_list, i];
    endif
  endfor
  if length(index_list) == 0
    solution = "unfotunately, there's no linearly ind. vectors, I dont know how it happend, maybe your import is incorrect";
    return;
  endif
  solution = matrix(:, index_list);
endfunction

function intersectionBasis = findIntersectionBasis(U, V)
    A = [U, V];
    rrefA = rref(A);
    [m, n] = size(rrefA);
    intersectionBasis = [];
    dependent_indices = find(sum(abs(rrefA), 1) == 0);
    if ~isempty(dependent_indices)
        for idx = dependent_indices
            if idx <= size(U, 2)
                intersectionBasis = [intersectionBasis, U(:, idx)];
            endif
        endfor
    endif
endfunction

function lead_vars = findLeadVars(rref_matrix)
  [m, n] = size(rref_matrix);
  lead_vars = [];
  for i = 1:m;
    if rref_matrix(i,i) == 1;
      lead_vars = [lead_vars, i];
    endif
  endfor
endfunction

function FSR = findFSR(matrix)
  rref_matrix = rref(matrix);
  [m, n] = size(rref_matrix);
  lead_vars = findLeadVars(rref_matrix);
  free_vars = setdiff(1:n, lead_vars);

  FSR = zeros(length(free_vars), n);

  for i = 1:length(free_vars)
    FSR(i, free_vars(i)) = 1;
    for j = 1:length(lead_vars)
        if rref_matrix(j, free_vars(i)) ~= 0
            FSR(i, lead_vars(j)) = -rref_matrix(j, free_vars(i));
        end
    end
  end

endfunction





function unionFSR = findUnionFSR(U, V)
  UV = [U, V];
  unionFSR = findFSR(UV);
endfunction



function intersectionBasis = findIntersectionBasis_1(U, V)
  intersectionFSR = findUnionFSR(U, V);
  [m_FSR, n_FSR] = size(intersectionFSR);
  [m, n] = size(U);
  intersectionBasis = zeros(m, m_FSR);
  for i = 1:m_FSR; % 1:7
    new_vector = U(:,1) * intersectionFSR(1,i);
    for j = 2:m;
      new_vector = new_vector + (intersectionFSR(i,j) * U(:,j));
    endfor
    intersectionBasis(:, i) = new_vector;
  endfor



endfunction


function intersectionBasisSize = findIntersectionBasisSize(U, V);
   UV = [U,V];
   sizeUV = findBasisSize(UV)
   sizeU = findBasisSize(U)
   sizeV = findBasisSize(V)
   intersectionBasisSize = sizeU + sizeV - sizeUV;

endfunction
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

function FSR_matrix = findFSR_2(B)
  A = rref(B);
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
U = [2 6 2 0 -6; 4 3 3 8 5; -7 -4 -4 -14 -10; 3 7 5 4 -3; 1 2 7 7 5]
V = [8 -4 28 16 0; -2 -2 -4 -1 6; 6 6 12 3 -8; 8 2 22 10 8; 2 17 -11 -14 19];

UV = [U, V];

f = rref(UV);
unionBasis = findUnionBasis(U, V)
intersectionBasis = findIntersectionBasis(U, V)
unionFSR = findUnionFSR(U, V)
FSR2 = findFSR_2(UV)
intersectionBasisSize = findIntersectionBasisSize(U, V)
unionBasisSize = findBasisSize(UV)
findIntersectionBasis_1(U, V)
%реальний розмір базису відрізняється від бажаного(обчисленого за формулою, не знаю чому

