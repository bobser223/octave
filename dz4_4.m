clc
function result = functionpi(a)
  result = 0
  for i = 2:a
    if isprime(i)
      result = result + 1
    endif
  endfor
  endfunction
n = 2:1:1000
func_pi = functionpi(n)
func_ln = n / log(n);
plot(n,func_pi)
hold on;
plot(n, func_ln)
