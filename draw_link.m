function draw_link(handles, theta, L, R, nNodes,opa, P, O, RF, color)
x0 =0; y0 = 0; z0 = 0;
nCS = 2;          

th = linspace(0, 2*pi,nNodes);
z = linspace(z0,z0 + L,nCS)';

x = R * cos(th) + x0;
y = R * sin(th) + y0;

X = repmat(x,nCS,1);
Y = repmat(y,nCS,1);
Z = repmat(z,1,nNodes);

x_lid = repmat([x0; x0], 1, nNodes);
y_lid = repmat([y0; y0], 1, nNodes);
z_lids = repmat([z0; z0 + L], 1, nNodes);

X = [x_lid(1,:); X; x_lid(2,:)];
Y = [y_lid(1,:); Y; y_lid(2,:)];
Z = [z_lids(1,:); Z; z_lids(2,:)];

r1 = 0;
r2 = 0;
r3 = 0;
roll = 0;
pitch = 0;
yaw = 0;

if (RF == "B")
    yaw = yaw + theta(1);
elseif (RF == "1")
    pitch = pitch - theta(2);
    yaw = yaw + theta(1);
elseif (RF == "1'")
    roll = roll + pi/2;
    yaw = yaw + theta(1);
elseif (RF == "2")
    r2 = pi/2;
    pitch = pitch - theta(2);
    pitch = pitch - theta(3);
    yaw = yaw + theta(1);
elseif (RF == "3")
    r2 = pi/2;
    roll = roll + pi/2;
    pitch = pitch - theta(2);
    pitch = pitch - theta(3);
    pitch = pitch - theta(4);
    yaw = yaw + theta(1);
elseif (RF == "E")
    r2 = pi/2;
    roll = roll + pi/2;
    pitch = pitch - theta(2);
    pitch = pitch - theta(3);
    pitch = pitch - theta(4);
    yaw = yaw + theta(1);
end


for i = 1:4
   for j=1:nNodes
       point = [X(i,j); Y(i,j); Z(i,j)];
       point = rotation(r1, r2, r3)*point; 
       temp = rotation(roll, pitch, yaw)*point + P;
       X(i,j) = temp(1);
       Y(i,j) = temp(2);
       Z(i,j) = temp(3);
   end
end
surf(handles.axes,X,Y,Z,'FaceColor',color,'FaceAlpha',opa, 'EdgeColor','none');
end
