clc;
warning off;

A = [1 3 -2; 2 1 -1; 5 5 -4];

% Знаходження ядра матриці A
Q = null(A);

% Виведення розмірів ядра, якщо воно не порожнє
if isempty(Q)
    disp('Ядро матриці порожнє');
else
    disp('Базис ядра матриці A:');
    disp(Q);

    % Візуалізація простору розв'язків
    figure;
    for i = 1:size(Q, 2)
        quiver3(0, 0, 0, Q(1,i), Q(2,i), Q(3,i), 1);
        hold on;
    end
    title("Візуалізація простору розв'язків");
    xlabel('x1');
    ylabel('x2');
    zlabel('x3');
    axis equal;
    hold off;
end

