clc;
clear;
figure;

% Візуалізація ядра відображення (a)
subplot(1, 2, 1);
hold on;
grid on;
axis equal;
xlim([-2, 2]);
ylim([-2, 2]);
xlabel('x1');
ylabel('x2');
title('Ядро відображення (a)');
plot([-2, 2], [-2, 2], 'b');  % Лінія ядра

% Візуалізація образу відображення (a)
subplot(1, 2, 2);
hold on;
grid on;
axis equal;
xlim([-2, 2]);
ylim([-2, 2]);
xlabel('x1');
ylabel('x2');
title('Образ відображення (a)');
plot([-2, 2], [2, -2], 'r');  % Лінія образу

% Збереження графіків
saveas(gcf, 'plot_a.png');

clc;
clear;
figure;

% Візуалізація ядра відображення (b)
x = linspace(-1, 1, 10);
y = -0.2 * x;
z = -0.8 * x;
plot3(x, y, z, 'b');
hold on;
grid on;
xlabel('x1');
ylabel('x2');
zlabel('x3');
title('Ядро відображення (b)');
axis equal;

% Візуалізація образу відображення (b) може вимагати більш складного аналізу
% для точного визначення, тому тут показано лише ядро.
% Для образу можна використовувати, наприклад, параметричні поверхні, якщо необхідно.

% Збереження графіків
saveas(gcf, 'plot_b.png');

