clc
warning off
A = [1 2 3; 4 5 6; 7 8 9];
disp("     manual     ")
disp(A)

disp("     E1(4)     ")

A(1,:) = A(1,:) * 4;
disp(A)

disp("     E32(-2)    ")

A(3,:) = A(3,:) - 2 * A(2,:);
disp(A)

disp("     swap 1, 3 strings       ")

third_cap = A(1,:);
A(1,:) = A(3,:);
A(3,:) = third_cap;
disp(A)

