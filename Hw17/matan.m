#1############################################################
pkg load symbolic;

clc;
warning off;
function ans = legitCheck(an, an1)
  syms n;
  ans = "ряд збігається";
  if double(limit(an, n, Inf)) ~= 0;
    ans = "ряд не збігається";
    return;
  endif;
  if double(limit(an1/an, n, Inf)) > 1;
    ans = "ряд не збігається";
    return;
  endif
endfunction

syms n;
an = 1 / ((3 .* n - 2) .* (3 .* n + 1));
an1 = 1 / ((3 .* (n + 1) - 2) .* (3 .* (n + 1) + 1));

ans = legitCheck(an, an1)

f = @(n) 1 ./ ((3 .* n - 2) .* (3 .* n + 1));
series_sum = sum(f([1:10000]))


#2##########################################

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
  if double(limit(an1/an, n, Inf)) > 1;
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
  if double(limit(an.^(1/n), n, Inf)) > 1;
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


#3#############################################

pkg load symbolic

clc;
warning off;
syms n;

function ans = legitCheck(an, an1)
  ans = "ряд повністю збігається";
  syms n;
  if isMonotonic1 == false;
    ans = "ряд не збігається";
  endif;
  if double(limit(an, n, Inf)) ~= 0;
    ans = "ряд не збігається";
    return;
  endif;
  if double(limit(an1/an, n, Inf)) < 0 || double(limit(an1/an, n, Inf)) > 1;
    ans = "ряд умовно збігається";
    return;
  endif
endfunction




function ans = legitCheck2(an, an1)
  ans = "ряд повністю збігається";
  syms n;
  if isMonotonic2 == false;
    ans = "ряд не збігається";
  endif;
  if double(limit(an, n, Inf)) ~= 0;
    ans = "ряд не збігається";
    return;
  endif;
  if double(limit(an1/an, n, Inf)) > 1;
    ans = "ряд умовно збігається";
    return;
  endif
endfunction

function monotonic = isMonotonic1()
  N = 1000;
  monotonic = true;
  for n = 1:N
    an = 1 / (n * (n^(1/3)));
    an1 = 1 / ((n + 1) * ((n + 1)^(1/3)));
    if an < an1
        monotonic = false;
        break;
    endif;
  endfor;
endfunction;

function monotonic = isMonotonic2()
  N = 1000;
  monotonic = true;
  for n = 1:N
    an = factorial(3 * n - 2) / factorial(2 * n + 5);
    an1 = factorial(3 * (n + 1) - 2) / factorial(2 * (n + 1) + 5);
    if an < an1
        monotonic = false;
        disp(an)
        disp(an1)
        break;
    endif;
  endfor;
endfunction;

# 1
an = 1 ./ (n * (n .^ (1/3)));
an1 = 1 ./ ((n + 1) * ((n + 1) .^ (1/3)));
legitCheck(an, an1)

# 2
syms n;
an = factorial(3 .* n - 2) ./ factorial(2 .* n + 5);
an1 = factorial(3 .* (n + 1) - 2) ./ factorial(2 .* (n + 1) + 5);
legitCheck2(an, an1)



