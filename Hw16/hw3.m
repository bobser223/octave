clc;
warning off;

M = [1, -1; 1, -1];
[i, j] = rref(M);
obraz_base = M(:, j);

core_base = null(M);

quiver(0, 0, obraz_base(1,1), obraz_base(2,1), 0, 'b');
pause(2);
quiver(0, 0, core_base(1,1), core_base(2,1), 0, 'r');
pause(2);

M = [1 1 1 ;2, -2 3; 3 -1, 4];
[i, j] = rref(M);
obraz_base = M(:, j)
core_base = null(M)



[u, v] = meshgrid(-10:1:10, -10:1:10);

XT = u * obraz_base(1,1) + v * obraz_base(1,2);
YT = u * obraz_base(2, 1) + v * obraz_base(2,2);
ZT = u * obraz_base(3,1) + v * obraz_base(3,2);


surf(XT, YT, ZT, 'FaceAlpha', 0.5);
title('obraz');
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
grid on;
axis equal;

pause(2);

figure;
quiver3(0,0,0, core_base(1,1), core_base(2,1), core_base(3,1), 'AutoScale', 'on', 'Color', 'b');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('base');
