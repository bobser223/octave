clc
tic
function result = functionpi(a)
    result = zeros(size(a));
    for idx = 1:length(a)
        n = a(idx);
        count = 0;
        for i = 2:n
            if isprime(i)
                count = count + 1;
            end
        end
        result(idx) = count;
    end
endfunction

n = 2:10^6;
func_pi = functionpi(n);

func_ln = n ./ log(n);

plot(n, func_pi)
hold on;
plot(n, func_ln)
toc
