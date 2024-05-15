clc
X = 0:0.5:5;
Y = 0:0.5:5;

A1=3;
B1=0;
C1=-3;
D1=6;

A2=3;
B2=0;
C2=-3;
D2=12;



A1=input("A1 = ");
B1=input("B1 = ");
C1=input("C1 = ");
D1=input("D1 = ");

A2=input("A2 = ");
B2=input("B2 = ");
C2=input("C2 = ");
D2=input("D2 = ");

b0_1 = -D1/C1;
b1_1 = -A1/C1;
b2_1 = -B1/C1;

[x, y] = meshgrid(X,Y);

z_1 = b0_1+b1_1*x+b2_1*y;
surf (x, y, z_1);

grid on;
xlabel('x','FontSize',20);
ylabel('y','FontSize',20);
zlabel('z','FontSize',20);
hold on;
eq1 = sprintf("%d x + %d y + %d z + %d = 0", A1, B1, C1, D1);
eq2 = sprintf("%d x + %d y + %d z + %d = 0", A2, B2, C2, D2);


title(sprintf("%s, %s", eq1, eq2));

b0_2 = -D2/C2;
b1_2 = -A2/C2;
b2_2 = -B2/C2;


z_2 = b0_2+b1_2*x+b2_2*y;

surf (x, y, z_2);

