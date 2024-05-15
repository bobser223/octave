function result = desToBin(num)
  result = "";
  while num > 0
    bit = num2str(mod(num, 2));
    result = strcat(bit, result);
    num = fix(num / 2);
  endwhile
endfunction

num = 2
result = desToBin(num)
