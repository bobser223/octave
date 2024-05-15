clc
function[theta, r] = decToPol(x, y);
  theta = atan2(y, x);
  r = (x.^2+ y.^2).^0.5;
endfunction;

function[x, y] = polToDec(theta, r);
  x = r*cos(theta);
  y = r*sin(theta);
endfunction;

function[theta, r, z] = decToPol3(x, y, z);
  z = z;
  [theta, r] = decToPol(x, y);
endfunction

function[x, y, z] = polToDec3(theta, r, z);
  z = z;
  [x, y] = polToDec(theta, r);
endfunction;

function[theta, phi, r] = decToSph(x, y, z);
  r = (x.^2 + y.^2 + z.^2).^0.5;
  theta = atan2(y, x);
  phi = atan2((x.^2 + y.^2).^0.5, z);
endfunction

function[x, y, z] = sphToDec(theta, phi, r);
  x = r * sin(phi) * cos(theta);
  y = r * sin(phi) * sin(theta);
  z = r * cos(phi);
endfunction;
x = 2
y = 3
z = 4




[theta, r] = decToPol(x, y)
disp("     ")
[x, y] = polToDec(theta, r)
disp("     ")
[theta, r, z] = decToPol3(x, y, z)
disp("     ")
[x, y, z] = polToDec3(theta, r, z)
disp("     ")
[theta, phi, r] = decToSph(x, y, z)
disp("     ")
[x, y, z] = sphToDec(theta, phi, r)




