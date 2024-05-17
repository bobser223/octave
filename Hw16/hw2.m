clc;
warning off;

function ans = solveMatrix(M, addition)
  rrefM = rref(M);
  [n, m] = size(rrefM);
  [n1, m1] = size(addition);
  ans = zeros(1, m1);
  for i = 1:n;
    if M(i,i) == 1;
      ans(i) = addition(i);
    endif
  endfor



endfunction;

A = [1 3 -2; 2 1 -1; 5 5 -4];
addition = [2 2 6]
Q = null(A);


if isempty(Q)
    disp('Ядро матриці порожнє');
else
    disp('Базис ядра матриці A:');
    disp(Q);

    figure;
    for i = 1:size(Q, 2)
        quiver3(0, 0, 0, Q(1,i), Q(2,i), Q(3,i), 1);
        hold on;
    end
    title("Ядро");
    xlabel('x1');
    ylabel('x2');
    zlabel('x3');
    axis equal;
    pause(3);
    hold off;

    vector = ans = solveMatrix(A, addition);

    figure;
    for i = 1:size(Q, 2)
        quiver3(0, 0, 0, Q(1,i) + vector(1), Q(2,i) + vector(2), Q(3,i) + vector(3), 1);
        hold on;
    end
    title("образ");
    xlabel('x1');
    ylabel('x2');
    zlabel('x3');
    axis equal;

end

