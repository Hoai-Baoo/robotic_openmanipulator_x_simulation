syms d1 a2 a3 a4 th0 th1 th2 th3 th4
%theta0 = 90 - atan(24/128)

DH = [0     pi/2    d1  th1;
      a2    0       0   th2+th0;
      a3    0       0   th3-th0;
      a4    0       0   th4];
  
  
A10 = calculate_pose(DH,1,1)
A20 = calculate_pose(DH,1,2)
A30 = calculate_pose(DH,1,3)
A40 = calculate_pose(DH,1,4)

z0 = [0;0;1];
p0 = [0;0;0];

z1 = [A10(1,3); A10(2,3); A10(3,3)];
p1 = [A10(1,4); A10(2,4); A10(3,4)];

z2 = [A20(1,3); A20(2,3); A20(3,3)];
p2 = [A20(1,4); A20(2,4); A20(3,4)];


z3 = [A30(1,3); A30(2,3); A30(3,3)];
p3 = [A30(1,4); A30(2,4); A30(3,4)];


z4 = [A40(1,3); A40(2,3); A40(3,3)];
p4 = [A40(1,4); A40(2,4); A40(3,4)];

J = [dotvector(z0, p4 - p0) dotvector(z1, p4 - p1) dotvector(z2, p4 - p2) dotvector(z3, p4 - p3)];

J_reduction = [J(1,:); J(2,:); J(3,:); J(4,:)]
detJ = simplify(det(J_reduction))


function T = calculate_pose(DH,RF_A,RF_B)

%calc denavit hartenburg matrix
T=eye(4);
for i = RF_A:RF_B
    cos_theta_i = cos(DH(i,4));sin_theta_i = sin(DH(i,4));
    cos_alpha_i = cos(DH(i,2));sin_alpha_i = sin(DH(i,2));
    ai = DH(i,1); 
    di = DH(i,3);
    Ti=[cos_theta_i  -cos_alpha_i*sin_theta_i  sin_alpha_i*sin_theta_i  ai*cos_theta_i;
        sin_theta_i  cos_alpha_i*cos_theta_i  -sin_alpha_i*cos_theta_i  ai*sin_theta_i;
        0            sin_alpha_i               cos_alpha_i              di            ;
        0            0                         0                        1];
    T =  simplify((T*Ti));
end
end


function j = dotvector(u,p)
x = simplify(-u(3)*p(2) + u(2)*p(3));
y = simplify(u(3)*p(1) - u(1)*p(3));
z = simplify(-u(2)*p(1) + u(1)*p(2));
j = [x;y;z;u];
end