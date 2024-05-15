clc

piString = sprintf('%.20f', pi());
disp(piString)
piString = strrep(piString, '.', '');
disp(piString)
result = '';
for i = 1:length(piString)
    currentString = piString(i:i+9);
    if isPrime(str2num(currentString))
        result = currentString;
        break;
    endif
endfor

disp(result);
