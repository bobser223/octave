clc

matrix = [2 1 3; 1 1 1; 1 3 2];
addition = [10, 6, 13];
% операції з 1 рядком
matrix(1,:) = matrix(1,:) ./ matrix(1,1);
addition(1) = addition(1) ./ matrix(1,1);
matrix(2,:) = matrix(2,:) - matrix(1,:) .* (matrix(2,1) / matrix(1,1));
addition(2) = addition(2) - addition(1) .* (matrix(2,1) / matrix(1,1));
matrix(3,:) = matrix(3,:) - matrix(1,:) .* (matrix(3,1) / matrix(1,1));
addition(3) = addition(3) - addition(1) .* (matrix(3,1) / matrix(1,1));
% операції з другим рядком
matrix(3,:) = matrix(3,:) - matrix(2,:) .* (matrix(3,2) / matrix(2,2));
addition(3) = addition(3) - addition(2) .* (matrix(3,2) / matrix(2,2));
% отримали верхню трикутну
% отримуємо третій 0 в другому рядку
matrix(2,:) = matrix(2,:) - matrix(3,:) .* (matrix(2,3) / matrix(3,3));
addition(2) = addition(2) - addition(3) .* (matrix(2,3) / matrix(3,3));
% отримуємо третій 0 в першому рядку
matrix(1,:) = matrix(1,:) - matrix(3,:) .* (matrix(1,3) / matrix(3,3));
addition(1) = addition(1) - addition(3) .* (matrix(1,3) / matrix(3,3));
%другий 0 в першому рядку
matrix(1,:) = matrix(1,:) - matrix(2,:) .* (matrix(1,2) / matrix(2,2));
addition(1) = addition(1) - addition(2) .* (matrix(1,2) / matrix(2,2));
%отримуємо одинички
matrix(1,:) = matrix(1,:) ./ matrix(1,1);
addition(1) = addition(1) ./ matrix(1,1);
matrix(2,:) = matrix(2,:) ./ matrix(2,2);
addition(2) = addition(2) ./ matrix(2,2);
matrix(3,:) = matrix(3,:) ./ matrix(3,3);
addition(3) = addition(3) ./ matrix(3,3);

x1 = addition(1)
x2 = addition(2)
x3 = addition(3)
