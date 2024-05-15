clc;
warning off;

func1 = 1/x;
func2 = sqrt(x);

x0 = fzero(@(x)(1/x - sqrt(x)), 1);


k1 = gradient(@(x)(1/x), x0)
k2 = gradient(@(x)sqrt(x), x0)

tan_alpha = abs((k1-k2)/(1+k1*k2));
alpha = atan(tan_alpha)


