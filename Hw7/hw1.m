clc


function result = day(date);
  date = strrep(date, ".", "-");
  [n, result] = weekday(date);


endfunction;


date = "18.03.2025";
result = day(date)
