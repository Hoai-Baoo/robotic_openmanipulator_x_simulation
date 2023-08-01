syms theta1 theta2 theta3 theta4 d1 a2 a3 a4

theta1 = 45;
theta2 = 61.8054;
theta3 = -42.3153;
theta4 = -19.4901;
theta1 = theta1 * pi/180;
theta2 = theta2 * pi/180;
theta3 = theta3 * pi/180;
theta4 = theta4 * pi/180;

d1 = 77;
a2 = sqrt(24^2 + 128^2);
a3 = 124;
a4 = 126;
T0_1 = calc(0,1, theta1, theta2, theta3, theta4, d1, a2, a3, a4);
T0_2 = calc(0,2, theta1, theta2, theta3, theta4, d1, a2, a3, a4);
T0_3 = calc(0,4, theta1, theta2, theta3, theta4, d1, a2, a3, a4);
T0_4 = calc(0,5, theta1, theta2, theta3, theta4, d1, a2, a3, a4);

z0 = [0;0;1];
p0 = [0;0;0];

z1 = [T0_1(1,3); T0_1(2,3); T0_1(3,3)]
p1 = [T0_1(1,4); T0_1(2,4); T0_1(3,4)]

z2 = [T0_2(1,3); T0_2(2,3); T0_2(3,3)]
p2 = [T0_2(1,4); T0_2(2,4); T0_2(3,4)]


z3 = [T0_3(1,3); T0_3(2,3); T0_3(3,3)]
p3 = [T0_3(1,4); T0_3(2,4); T0_3(3,4)]


z4 = [T0_4(1,3); T0_4(2,3); T0_4(3,3)]
p4 = [T0_4(1,4); T0_4(2,4); T0_4(3,4)]


J = [dotvector(z0, p4 - p0) dotvector(z1, p4 - p1) dotvector(z2, p4 - p2) dotvector(z3, p4 - p3)]

Ve = J*[]

function DH = calc(start,number, theta1, theta2, theta3, theta4, d1, a2, a3, a4)
DH = [0     pi/2    d1  theta1;
      a2   0       0   theta2+pi/2;
      24    0       0   -pi/2;
      a3   0       0   theta3;
      a4   0       0   theta4];
T=eye(4);

for i = start+1:number
    cos_theta_i = cos(DH(i,4));sin_theta_i = sin(DH(i,4));
    cos_alpha_i = cos(DH(i,2));sin_alpha_i = sin(DH(i,2));
    ai = DH(i,1); 
    di = DH(i,3);
    Ti=[cos_theta_i  -cos_alpha_i*sin_theta_i  sin_alpha_i*sin_theta_i  ai*cos_theta_i;
        sin_theta_i  cos_alpha_i*cos_theta_i  -sin_alpha_i*cos_theta_i  ai*sin_theta_i;
        0            sin_alpha_i               cos_alpha_i              di            ;
        0            0                         0                        1];
    T = Ti;
end
DH = T;
end

function j = dotvector(u,p)
x = (-u(3)*p(2) + u(2)*p(3));
y = (u(3)*p(1) - u(1)*p(3));
z = (-u(2)*p(1) + u(1)*p(2));
j = [x;y;z;u];
end


