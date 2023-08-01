function move(handles, theta, opa)
global theta
theta1_edit = str2double(get(handles.edit_theta1,'String'))
theta2_edit = str2double(get(handles.edit_theta2,'String'));
theta3_edit = str2double(get(handles.edit_theta3,'String'));
theta4_edit = str2double(get(handles.edit_theta4,'String'));
N1 = 4;
N2 = 4;
N3 = 4;
N4 = 4;
if (theta(1) == theta1_edit)
    min_theta1 = theta1_edit;
    max_theta1 = theta(1);
    N1 = 0;
else 
    min_theta1 = theta(1);
    max_theta1 = theta1_edit;
end

if (theta(2) == theta2_edit)
    min_theta2 = theta2_edit;
    max_theta2 = theta(2);
    N2 = 0;
else 
    min_theta2 = theta(2);
    max_theta2 = theta2_edit;
end

if (theta(3) == theta3_edit)
    min_theta3 = theta3_edit;
    max_theta3 = theta(3);
    N3 = 0;
else 
    min_theta3 = theta(3);
    max_theta3 = theta3_edit;
end

if (theta(4) == theta4_edit)
    min_theta4 = theta4_edit;
    max_theta4 = theta(4);
    N4 = 0;
else 
    min_theta4 = theta(4);
    max_theta4 = theta4_edit;
end

for th1=linspace(min_theta1,max_theta1,N1)
    theta(1) = th1;
    set(handles.slider_theta1,'Value',theta(1));
    set(handles.edit_theta1,'String',theta(1));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end

for th2=linspace(min_theta2,max_theta2,N2)
    theta(2) = th2;
    set(handles.slider_theta2,'Value',theta(2));
    set(handles.edit_theta2,'String',theta(2));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end

for th3=linspace(min_theta3,max_theta3,N3)
    theta(3) = th3;
    set(handles.edit_theta2,'String',theta(2));
    set(handles.edit_theta3,'String',theta(3));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end

for th4=linspace(min_theta4,max_theta4,N4)
    theta(4) = th4;
    set(handles.slider_theta4,'Value',theta(4));
    set(handles.edit_theta4,'String',theta(4));
    draw_robot(handles, theta, opa);
    pause(0.0001);
end
end

