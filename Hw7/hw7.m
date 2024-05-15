warning off
clc

function result = checkISBN10(number);
  number = strrep(number, '-', '');
  if length(number) ~= 10;
    result = "код некоректний yy";
    return;
  endif;
  sum = 0;
  multiplier = 10;
  for i = 1:10;
    if number(i) == "X";
      sum += 10 * multiplier;
      continue;
    endif;
    sum += str2num(number(i)) * multiplier;
    multiplier -= 1;
  endfor;
  if fix(sum / 11) ~= sum / 11;
    result = "код некоректний";
    return;
  endif;
  result = "код правильний, книга існує";
endfunction;

number = "2-1234-5680-2"
result = checkISBN10(number)

