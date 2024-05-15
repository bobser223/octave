clc
function illumination = mixedProduct(vec1, vec2, vec3);
  illumination = dot(vec1, cross(vec2, vec3));
  quiver3(0,0,0,vec1(1),vec1(2), vec1(3));
  hold on;
  quiver3(0,0,0,vec2(1),vec2(2), vec2(3));
  hold on;
  quiver3(0,0,0,vec3(1),vec3(2), vec3(3));
  title(sprintf('Мішаний добуток векторів = %d', illumination));
  pause(3);
  hold off;
  close;
endfunction


function result = isComp(vec1, vec2, vec3);
  result = "Вектори НЕ компланарні";
  if dot(vec1, cross(vec2, vec3)) == 0
    result = "Вектори компланарні";
  endif;
  quiver3(0,0,0,vec1(1),vec1(2), vec1(3));
  hold on;
  quiver3(0,0,0,vec2(1),vec2(2), vec2(3));
  hold on;
  quiver3(0,0,0,vec3(1),vec3(2), vec3(3));
  title(sprintf('як ми бачимо %s', result))
  pause(3);
  hold off;
  close;
endfunction;

function result = sameSpace(dot1, dot2, dot3, dot4);
  vec1 = dot2 - dot1;
  vec2 = dot3 - dot1;
  vec3 = dot4 - dot1;
  result = "чотири точки НЕ лежать у одній площині";
  if dot(vec1, cross(vec2, vec3)) == 0;
    result = "чотири точки лежать у одній площині";
  endif;
  plot3(dot1);
  hold on;
  plot3(dot2);
  hold on;
  plot3(dot3);
  plot3(dot4);
  title(sprintf('як ми бачимо %s', result))
  pause(3);
  hold off;
  close;
endfunction;

vecC1 = [1, 2, 3];
vecC2 = [4, 5, 6];
vecC3 = [7, 8, 9];

vecP1 = [1, 2, 3];
vecP2 = [4, 5, 6];
vecP3 = [7, 8, 9];

dot1 = [0 0 0];
dot2 = [1 2 3];
dot3 = [4 5 6];
dot4 = [7 8 9];

disp(mixedProduct(vecP1, vecP2, vecP3));


disp(isComp(vecC1, vecC2, vecC3));



disp(sameSpace(dot1, dot2, dot3, dot4));



