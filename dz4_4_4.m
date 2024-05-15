function result = functionpi(n)
    lst = zeros(1, length(n)); % Ініціалізуємо список нулями
    for idx = 1:length(n)
        a = n(idx); % Поточне значення з діапазону
        prime_count = 0; % Лічильник простих чисел
        for i = 2:a
            if isprime(i)
                prime_count = prime_count + 1;
            end
        end
        lst(idx) = prime_count; % Записуємо кількість простих чисел у відповідний елемент списку
    end
    result = lst; % Повертаємо список кількостей простих чисел
end

n = 2:1000; % Діапазон значень n
func_ln = n ./ log(n); % Обчислюємо функцію ln(n)

plot(n, functionpi(n)); % Побудова графіка для результатів вашої функції
hold on;
plot(n, func_ln); % Побудова графіка для функції ln(n)
