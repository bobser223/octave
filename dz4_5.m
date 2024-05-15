clc
tic
format long
counter_of_primes = 0;
for _ = 1:10^1
  randnumber = randi([1000000000, 10000000000 - 1], 1, 1);
  if isprime(randnumber);
    counter_of_primes = counter_of_primes + 1;
  endif;
endfor;
percentage_of_primes = (number_of_primes / length(changed_numbers)) * 100;
disp((counter_of_primes / 10^3)*100);

numbers = randi([1000000000, 9999999999], 1e3, 1);
number_of_primes = sum(isprime(changed_numbers));
percentage_of_primes = (length(number_of_primes) / length(numbers)) * 100;
disp([ num2str(percentage_of_primes), '%']);
toc
