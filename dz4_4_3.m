clc
function result = functionpi(n)
  lst = []
  for a = n
    result = 0
    for i = 2:a
      if isprime(i)
        result = result + 1
      endif
    endfor
    lst(a) = result
  endfor
  endfunction
n = 2:1:1000
func_ln = n ./ log(n);
plot(n, functionpi(n))
hold on;
plot(n, func_ln)
