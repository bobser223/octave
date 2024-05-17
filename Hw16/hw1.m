clc;
warning off;
function solution = findUnionBasis(U, V)
  matrix = [U, V];
  solution = [];
  index_list = [];
  rref_matrix = rref(matrix);

  for i = 1:2
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

  for i = 1:2
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





S = [1 2 -1; 2 0 1];
T = [1 0 -1; 1 2 3];


[u, v] = meshgrid(-10:1:10, -10:1:10);


XS = u * S(1,1) + v * S(2,1);
YS = u * S(1, 2) + v * S(2,2);
ZS = u * S(1, 3) + v * S(2,3);

% Відкриваємо вікно для графіків
figure;


surf(XS, YS, ZS, 'FaceAlpha', 0.5);
title('Plane defined by vectors from S');
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
grid on;
axis equal;


pause(5);  % Пауза

% Кліримо фігуру для наступної площини
clf;

% Визначення координат для площини T
XT = u * T(1,1) + v * T(2,1);
YT = u * T(1,2) + v * T(2,2);
ZT = u * T(1,3) + v * T(2,3);


surf(XT, YT, ZT, 'FaceAlpha', 0.5);
title('Plane defined by vectors from T');
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
grid on;
axis equal;

pause(5)

unionBasis = findUnionBasis(S, T);

Xunion = u * unionBasis(1,1) + v * unionBasis(2,1);
Yunion = u * unionBasis(1,2) + v * unionBasis(2,2);
Zunion = u * 0 + v * 0;
#Zunion = u * unionBasis(1,3) + v * unionBasis(2,3);


figure;


surf(Xunion, Yunion, Zunion, 'FaceAlpha', 0.5);
title('Plane defined by vectors from unionBasis');
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
grid on;
axis equal;

pause(5);


B = findIntersectionBasis_1(S, T);

XB = u*B(1,1) + v*B(2,1);
YB = u*B(1,2) + v*B(2,2);
ZB = u*B(1,3) + v*B(2,3);


surf(XB, YB, ZB, 'FaceAlpha', 0.5);
title('Plane defined by vectors from S U T');
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
grid on;
axis equal;
