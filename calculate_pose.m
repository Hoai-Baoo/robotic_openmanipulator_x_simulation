function [Position,Orientation] = calculate_pose(DH,RF_A,RF_B)

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
    T =  (T*Ti);
end

Position = [round(T(1,4)); round(T(2,4)); round(T(3,4))];

theta1 = DH(1,4);
theta2 = DH(2,4) - pi/2;
theta3 = DH(4,4);
theta4 = DH(5,4);
Pitch = -(theta2 + theta3 + theta4); 

%Pitch (-pi/2, pi/2)
if (Pitch > -pi/2 && Pitch < pi /2) || (Pitch > 3*pi/2 && Pitch < 5*pi/2)
Roll = atan2((T(3,2)),(T(3,3)));
Pitch = atan2(-T(3,1), sqrt(T(1,1)^2 + T(2,1)^2) );
Yaw = atan2((T(2,1)),(T(1,1)));

elseif (Pitch > pi/2 && Pitch < 3*pi/2) || (Pitch > -3*pi/2 && Pitch < -pi/2)
%Pitch (pi/2, 3pi/2)
Roll = atan2((-T(3,2)),(-T(3,3)));
Pitch = atan2(-T(3,1), -sqrt(T(1,1)^2 + T(2,1)^2) );
Yaw = atan2((-T(2,1)),(-T(1,1)));
end

% if (round(Pitch*180/pi) == 90) || (round(Pitch*180/pi) == -270)
%     Yaw = 0;
%     Roll = atan2(T(1,2),T(2,2));
% elseif (round(Pitch*180/pi) == -90) || (round(Pitch*180/pi) == 270)
%     Yaw = 0;
%     Roll = -atan2(T(1,2),T(2,2));
% end

Roll = pi/2;
Yaw = theta1;

Orientation = [Roll;Pitch;Yaw];
end