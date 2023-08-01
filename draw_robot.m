function draw_robot(handles, theta, opa)
theta = theta.*pi/180;
theta1 = theta(1);
theta2 = theta(2);
theta3 = theta(3);
theta4 = theta(4);

%Show workspace
if get(handles.checkbox_workspace, 'Value')
    cla(handles.axes,'reset');
    mark = 'b.';
    draw_workspace(handles,mark);
    
else
    cla(handles.axes,'reset');
end


hold(handles.axes,'on');
grid(handles.axes,'on');
rotate3d(handles.axes,'on');
view(handles.axes,[20,20]);

xlabel(handles.axes,"X");
ylabel(handles.axes,"Y");
zlabel(handles.axes,"Z");
xlim(handles.axes,[-400 400]);
ylim(handles.axes,[-400 400]);
zlim(handles.axes,[-200 500]);

  
DH = [0     pi/2    77  theta1;
      128   0       0   theta2+pi/2;
      24    0       0   -pi/2;
      124   0       0   theta3;
      126   0       0   theta4];
  
%Base
link = 0;
[P0,O0] = calculate_pose(DH,1,link);
%Link 1
link = 1;
[P1,O1] = calculate_pose(DH,1,link);

%Link 1'
link = 2;
[P1_,O1_] = calculate_pose(DH,1,link);

%Link 2
link = 3;
[P2,O2] = calculate_pose(DH,1,link);

%Link 3
link = 4;
[P3,O3] = calculate_pose(DH,1,link);

% End vector
link = 5;
[P4,O4] = calculate_pose(DH,1,link);



set(handles.edit_emitter_X,'String',num2str(P4(1)));
set(handles.edit_emitter_Y,'String',num2str(P4(2)));
set(handles.edit_emitter_Z,'String',num2str(P4(3)));
set(handles.edit_emitter_Roll,'String',num2str(round(O4(1)*180/pi)));
set(handles.edit_emitter_Pitch,'String',num2str(round(O4(2)*180/pi)));
set(handles.edit_emitter_Yaw,'String',num2str(round(O4(3)*180/pi)));


%Draw Coordinate
if get(handles.checkbox_coor0, 'Value')
draw_coordinate(handles, theta, P0, O0, "B");
end
if get(handles.checkbox_coor1, 'Value')
draw_coordinate(handles, theta, P1, O1, "1");
end
if get(handles.checkbox_coor1_, 'Value')
draw_coordinate(handles, theta, P1_, O1_, "1'");
end
if get(handles.checkbox_coor2, 'Value')
draw_coordinate(handles, theta, P2, O2, "2");
end
if get(handles.checkbox_coor3, 'Value')
draw_coordinate(handles, theta, P3, O3, "3");
end
if get(handles.checkbox_coor4, 'Value')
draw_coordinate(handles, theta, P4, O4, "E");
end
%Draw link

%Link0
color = 'k';
draw_link(handles, theta, 77, 30, 5, opa, P0, O0, "B", color);

%Link1
color = 'r';
draw_link(handles, theta, 128, 20, 10, opa, P1, O1,"1", color);

%Link1'
color = 'b';
O1_(1) = O1_(1) - pi/2;
draw_link_1(handles, 24*2,20,10, opa, P1_, O1_, color);

%Link2
color = 'g';
draw_link(handles, theta, 124, 20, 10, opa, P2, O2, "2", color);

%Link3
color = 'y';
draw_link(handles, theta, 126, 20, 10, opa, P3, O3, "3", color);

%End Vector
color = 'c';
draw_link(handles, theta, 20, 20, 10, opa, P4, O4, "E", color);

end