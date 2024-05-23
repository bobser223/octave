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
  if limit(an1/an, n, Inf) > 1;
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


