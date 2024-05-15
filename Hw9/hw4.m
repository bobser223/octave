clc;
warning off;

function q = find_rational_between(a, b);
  if a > b
    temp = a;
    a = b;
    b = temp;
  end

  mid = (a + b) / 2;
  [num, denom] = rat(mid);
  q = num / denom;
end

a = sqrt(2);
b = sqrt(2.1);
q = find_rational_between(a, b)
