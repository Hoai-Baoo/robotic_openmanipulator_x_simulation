function theta = inverse_calc(handles, Px,Py,Pz,Pit)
d1 = 77;
a2 = sqrt(24^2 + 128^2);
a3 = 124;
a4 = 126;
Pit = - Pit;

theta0 = pi/2-atan(24/128);
theta1 = atan2(Py,Px);

if (Px == 0)
    theta1 = pi/2;
end

condition = sqrt((Px*cos(theta1) + Py*sin(theta1) - a4*cos(Pit))^2 + (Pz - d1 - a4*sin(Pit))^2);

if ( (condition >= abs(a2-a3)) && (condition <= a2 + a3))
    c3 = ((Px*cos(theta1) + Py*sin(theta1) - a4*cos(Pit))^2 + (Pz - d1 - a4*sin(Pit))^2 - a2^2 - a3^2)/(2*a2*a3);
    
    s3 = sqrt(1-c3^2);
    theta3 = theta0 - atan2(s3,c3);

    D11 = a2*cos(theta0)+a3*cos(theta3);
    D21 = a2*sin(theta0)+a3*sin(theta3);
    b1 = Px*cos(theta1) + Py*sin(theta1) - a4*cos(Pit);
    b2 = Pz - d1 - a4*sin(Pit);

    s2 = (D11*b2 - D21*b1)/(b1^2+b2^2);
    c2 = (D11*b1 + D21*b2)/(b1^2+b2^2);
    theta2 = atan2(s2,c2);
    theta4 = Pit - theta2 - theta3;

    theta = [theta1 theta2 theta3 theta4].*180/pi;   
    if ((theta(1) > -180 && theta(1) < 180) && (theta(2) < 90 && theta(2) > -90) && (theta(3) < 90 && theta(3) > -90) && (theta(4) < 90 && theta(4) > -90))
        set(handles.text_notification,'String',"Done",'ForegroundColor','g');
    else
        theta = 0;
        set(handles.text_notification,'String',"Out of work space!!",'ForegroundColor','r');
    end
else
    theta = 0;
    set(handles.text_notification,'String',"Out of work space!!",'ForegroundColor','r');
end
end

