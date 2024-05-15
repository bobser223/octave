clc
format long
eString = "2.71828182845904523536028747135266249775724709369995957496696762772076630353547594571382178525166427427466391932003059921817413596629043572900334295260595630738132328627943490763233829880753195251019011573834187930702154089149934884167509244761460668082264800168477411853742345442437107539077744992069"
disp(eString)
eString = strrep(eString, '.', '');
disp(eString)
result = '';
for i = 1:length(eString)
    currentString = eString(i:i+9);
    if isPrime(str2num(currentString))
        result = currentString;
        break;
    endif
endfor

fprintf(result);
