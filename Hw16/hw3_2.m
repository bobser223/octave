clc;
clear;
pkg load symbolic;

% Символьні змінні
syms x1 x2 x3;

% Відображення (a)
A_a = [1, -1; -1, 1];
phi_a = [x1 - x2; x2 - x1];

% Відображення (b)
A_b = [1, 1, 1; 2, -2, 3; 3, -1, 4];
phi_b = [x1 + x2 + x3; 2*x1 - 2*x2 + 3*x3; 3*x1 - x2 + 4*x3];

% Ядро для відображення (a) і (b)
kernel_a = null(sym(A_a));
kernel_b = null(sym(A_b));

% Образ для відображення (a) і (b) через rref
[reduced_a, pivot_columns_a] = rref(sym(A_a));
[reduced_b, pivot_columns_b] = rref(sym(A_b));

% Вивід результатів
disp('Ядро відображення (a):');
disp(kernel_a);
disp('Півотні стовпці для образу відображення (a):');
disp(pivot_columns_a);

disp('Ядро відображення (b):');
disp(kernel_b);
disp('Півотні стовпці для образу відображення (b):');
disp(pivot_columns_b);

