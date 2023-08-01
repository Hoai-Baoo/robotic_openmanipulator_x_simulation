function move_inv(handles, theta, opa)
% global opa;
theta1_current = str2double(get(handles.edit_theta1,'String'));
theta2_current = str2double(get(handles.edit_theta2,'String'));
theta3_current = str2double(get(handles.edit_theta3,'String'));
theta4_current = str2double(get(handles.edit_theta4,'String'));

theta1_new = theta(1);
theta2_new = theta(2);
theta3_new = theta(3);
theta4_new = theta(4);
N1 = 4;
N2 = 4;
N3 = 4;
N4 = 4;
if (theta1_current == theta1_new)
    N1 = 0;
end

if (theta2_current == theta2_new)
    N2 = 0;
end

if (theta3_current == theta3_new)
    N3 = 0;
end

if (theta4_current == theta4_new)
    N4 = 0;
end

theta(1) = theta1_current;
theta(2) = theta2_current;
theta(3) = theta3_current;
theta(4) = theta4_current;

for th4=linspace(theta4_current,theta4_new,N4)
    theta(4) = th4;
    set(handles.slider_theta4,'Value',theta(4));
    set(handles.edit_theta4,'String',theta(4));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end

for th3=linspace(theta3_current,theta3_new,N3)
    theta(3) = th3;
    set(handles.edit_theta3,'String',theta(3));
    set(handles.edit_theta3,'String',theta(3));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end

for th2=linspace(theta2_current,theta2_new,N2)
    theta(2) = th2
    set(handles.slider_theta2,'Value',theta(2));
    set(handles.edit_theta2,'String',theta(2));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end

for th1=linspace(theta1_current,theta1_new,N1)
    theta(1) = th1;
    set(handles.slider_theta1,'Value',theta(1));
    set(handles.edit_theta1,'String',theta(1));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end        

end

