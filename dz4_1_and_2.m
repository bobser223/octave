clc
tic
warning off
counter_of_primes = 0;
counter_of_twin_primes = 0;
n = 0;
while n < 10^6;
  if isprime(n);
    counter_of_primes = counter_of_primes + 1;
  endif;
  if isprime(n) & isprime(n + 2);
    counter_of_twin_primes = counter_of_twin_primes + 2;
  endif;
  n = n + 1;
endwhile;
disp(counter_of_primes)
disp(counter_of_twin_primes)
toc
