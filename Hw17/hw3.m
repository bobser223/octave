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
  if limit(an1/an, n, Inf) > 1;
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
  if limit(an1/an, n, Inf) < 0 || limit(an1/an, n, Inf) > 1;
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


