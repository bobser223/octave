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

% Розв'язання систем для ядра (a) і (b)
kernel_a = solve([phi_a(1) == 0, phi_a(2) == 0], [x1, x2]);
kernel_b = solve([phi_b(1) == 0, phi_b(2) == 0, phi_b(3) == 0], [x1, x2, x3]);

% Використання parametric equations для визначення образу
params = sym('t', [1, 3]); % Параметри t1, t2, t3 для образу
image_a = subs(phi_a, [x1, x2], [params(1), params(2)]);
image_b = subs(phi_b, [x1, x2, x3], [params(1), params(2), params(3)]);

% Вивід результатів
disp('Ядро відображення (a):');
disp(kernel_a);
disp('Образ відображення (a):');
disp(image_a);

disp('Ядро відображення (b):');
disp(kernel_b);
disp('Образ відображення (b):');
disp(image_b);

