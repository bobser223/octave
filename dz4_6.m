tic
numbers = randi([1000000000, 9999999999], 1e3, 1)
changed_numbers = numbers(mod(numbers, 2) ~= 0 & mod(numbers, 3) ~= 0 & mod(numbers, 5) ~= 0 & mod(numbers, 7) ~= 0 & mod(numbers, 11) ~= 0);
number_of_primes = sum(isPrime(changed_numbers));
percentage_of_primes = (number_of_primes / length(changed_numbers)) * 100;
disp([ num2str(percentage_of_primes), '%']);
toc
