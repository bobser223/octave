clc
function vec_ill = vector_ilumination(vec1, vec2);
  vec_ill = cross(vec1, vec2);
  quiver3(0,0,0,vec1(1),vec1(2), vec1(3));
  hold on;
  quiver3(0,0,0,vec2(1),vec2(2), vec2(3));
  hold on;
  quiver3(0,0,0,vec_ill(1),vec_ill(2), vec_ill(3));
  title(sprintf("Векторний добуток цих векторів %d",vec_ill))
  pause(5);
  hold off;
  close;
endfunction

function vol = triangle_volume(a, b, c, d)

  A = a - d;
  B = b - d;
  C = c - d;
  B1 = b - a;
  C1 = c - a;
  C2 = c - b;

  vol = (1/6)*dot(A, cross(B, C));
  quiver3(d(1), d(2), d(3) , A(1),A(2), A(3));
  hold on;
  quiver3(d(1), d(2), d(3) ,B(1),B(2), B(3));
  quiver3(d(1), d(2), d(3) ,C(1),C(2), C(3));
  quiver3(a(1), a(2), a(3) ,B1(1),B1(2), B1(3));
  quiver3(a(1), a(2), a(3) ,C1(1),C1(2), C1(3));
  quiver3(b(1), b(2), b(3) ,C2(1),C2(2), C2(3));
  title(sprintf(" об'єм цього трикутника = %d", vol))
  pause(5);
  hold off;
  close;
endfunction


vec1 = [1 2 3];
vec2 = [4 5 6];
vec3 = (vector_ilumination(vec1, vec2))


versh = [1 2 3 4];
a = [22 3 4];
b = [3 78 5];
c = [7 8 100];
d = [4 5 6];


volume = triangle_volume(a, b, c, d)





