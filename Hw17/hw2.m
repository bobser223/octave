pkg load symbolic;
# я знаю що перший на Д'аламбера, а другий на Коші, але у нас же компухтер
# а не голова тому можна затестити і те і те

function ans = legitCheckDal(an, an1)
  syms n;
  ans = "ряд збігається за Д'аламбером";
  if double(limit(an, n, Inf)) ~= 0;
    ans = "ряд не збігається";
    return;
  endif;
  if limit(an1/an, n, Inf) < 0 || limit(an1/an, n, Inf) > 1;
    ans = "ряд не збігається";
    return;
  endif
endfunction


function ans = legitCheckKosh(an)
  syms n;
  ans = "ряд збігається за Коші";
  if double(limit(an, n, Inf)) ~= 0;
    ans = "ряд не збігається";
    return;
  endif;
  if limit(an.^(1/n), n, Inf) > 1;
    ans = "ряд не збігається";
    return;
  endif
endfunction

disp("ряд 1:")
syms n;
an = (1000 .^ n) / factorial(n);
an1 = (1000 .^ (n + 1)) / factorial(n + 1);

ans = legitCheckDal(an, an1)
ans = legitCheckKosh(an)


disp('ряд 2:')
syms n;
an = (((n + 1) ./ n) .^ n) / 3 .^ n;
an1 = (((n + 2) ./ (n+1)) .^ (n + 1)) / 3 .^ (n + 1);


ans = legitCheckDal(an, an1)
ans = legitCheckKosh(an)
