clc;
warning off;
function result = randNums(quantyty);
  m = 10 ;
  c = 7 ;
  a = 7;
  result = [0] * quantyty;
  for i = 1:(quantyty - 1);
    result(i+1) = mod((a * result(i) + c) , m);
  endfor;
 endfunction;

 quantyty = 1000
 result = randNums(quantyty)
