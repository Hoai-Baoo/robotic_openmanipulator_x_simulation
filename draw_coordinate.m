function draw_coordinate(handles, theta, P, O, RF)
roll = 0;
pitch = 0;
yaw = 0;

if (RF == "B")
    yaw = yaw;
elseif (RF == "1")
    roll = roll + pi/2;
    pitch = pitch;
    yaw = yaw + theta(1);
elseif (RF == "1'")
    roll = roll + pi/2;
elseif (RF == "2")
    roll = roll + pi/2;
    pitch = pitch - theta(2);
    pitch = pitch;
    yaw = yaw + theta(1);
elseif (RF == "3")
    roll = roll + pi/2;
    pitch = pitch - theta(2);
    pitch = pitch - theta(3);
    pitch = pitch;
    yaw = yaw + theta(1);
elseif (RF == "E")
    roll = roll + pi/2;
    pitch = pitch - theta(2);
    pitch = pitch - theta(3);
    pitch = pitch - theta(4);
    yaw = yaw + theta(1);
end

length = 60;
P0 = P;
Px = [length  ;  0    ;    0] ;
Py = [0   ;  length   ;    0] ;
Pz = [0   ;  0    ;    length];

R = rotation(roll, pitch, yaw);

Px = R*Px+ P0;
Py = R*Py+ P0;
Pz = R*Pz+ P0;

line(handles.axes, [P0(1) Px(1)],[P0(2) Px(2)],[P0(3) Px(3)],'linewidth',3,'color', 'red');
text(handles.axes, Px(1),Px(2),Px(3),'x' + RF);

line(handles.axes, [P0(1) Py(1)],[P0(2) Py(2)],[P0(3) Py(3)],'linewidth',3,'color', 'green');
text(handles.axes, Py(1),Py(2),Py(3),'y' + RF);

line(handles.axes, [P0(1) Pz(1)],[P0(2) Pz(2)],[P0(3) Pz(3)],'linewidth',3,'color', 'blue');
text(handles.axes, Pz(1),Pz(2),Pz(3),'z' + RF);
end

