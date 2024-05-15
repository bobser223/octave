clc
warning off

function result = desToBin(num)
  result = "";
  while num > 0
    bit = num2str(mod(num, 2));
    result = strcat(bit, result);
    num = fix(num / 2);
  endwhile
  if isempty(result)
    result = "0";
  endif
endfunction

function [c, d] = sameSize(a, b)
  if length(a) < length(b)
    while length(a) < length(b)
      a = strcat("0", a);
    endwhile
  elseif length(a) > length(b)
    while length(b) < length(a)
      b = strcat("0", b);
    endwhile
  endif
  c = a;
  d = b;
endfunction

function result = diferances(a, b)
  result = 0;
  a = desToBin(a);
  b = desToBin(b);
  [a, b] = sameSize(a, b);
  for i = 1:length(a)
    if a(i) ~= b(i)
      result += 1;
    endif
  endfor
endfunction

a = 18;
b = 87;

result = diferances(a, b)

