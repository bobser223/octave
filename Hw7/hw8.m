clc;
warning off;
function result = parityBit(binNum);
  if isnumeric(binNum);
    binNum = num2str(binNum);
  endif;
  sum = 0;
  for i = 1:length(binNum);
    if binNum(i) == "1"
      sum += 1;
    endif;
  endfor;
  if fix(sum / 2) ~= sum / 2;
    result = [binNum, "1"];
    return;
  endif;
  result = [binNum, "0"];

endfunction;


# бінарне число можна задати як числом так і рядком
binNum = "01110100"
result = parityBit(binNum)
binNum = 101110100
result = parityBit(binNum)
