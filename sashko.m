clc
matre=[ 2 1 3 ; 1 1 1 ; 1 3 2]
bi = [10 6 13]; %можна ввести довільне число
for i = 1:3
    for j = i+1:3
        chyslo = matre(j,i) / matre(i,i); % Используем matre(j,i) вместо matre(i,j)
        matre(j,:) = matre(j,:) - chyslo * matre(i,:);
        bi(j) = bi(j) - chyslo * bi(i); % Обновляем элементы вектора b
    endfor
endfor

for j = 1:3

    for i = j+1:3
        chyslo = matre(j,i) / matre(i,i); % Используем matre(j,i) вместо matre(i,j)
        matre(j,:) = matre(j,:) - chyslo * matre(i,:);
        bi(j) = bi(j) - chyslo * bi(i); % Обновляем элементы вектора b
    endfor
endfor
for i = 1:3
  bi(i)=bi(i)./matre(i,i)
  matre(i,:) = matre(i,:)./matre(i,i)

endfor
disp(bi)
prompt = 'Введіть перше значення:';
v = input(prompt)
prompt = 'Введіть друге значення:';
vv = input(prompt)
prompt = 'Введіть третє значення:';
vvv = input(prompt)
if matre(1,1) * v + matre(1,2) * vv + matre(1,3) * vvv == bi(1) && matre(2,1) * v + matre(2,2) * vv + matre(2,3) * vvv == bi(2) && matre(3,1) * v + matre(3,2) * vv + matre(3,3) * vvv == bi(3)
  disp("Результат правильний, всі радіють")
else
  disp("Результат неправильний, всі плачуть")
end
