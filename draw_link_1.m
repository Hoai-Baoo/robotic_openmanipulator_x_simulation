function draw_link_1(handles,L, R, nNodes,opa, P, O, color)
x0 =0; y0 = 0; z0 = 0;
nCS = 2;          

th = linspace(0, 2*pi,nNodes);
z = linspace(z0 -L/2 ,z0 + L/2,nCS)';

x = R * cos(th) + x0;
y = R * sin(th) + y0;

X = repmat(x,nCS,1);
Y = repmat(y,nCS,1);
Z = repmat(z,1,nNodes);

x_lid = repmat([x0; x0], 1, nNodes);
y_lid = repmat([y0; y0], 1, nNodes);
z_lids = repmat([z0 - L/2; z0 + L/2], 1, nNodes);

X = [x_lid(1,:); X; x_lid(2,:)];
Y = [y_lid(1,:); Y; y_lid(2,:)];
Z = [z_lids(1,:); Z; z_lids(2,:)];

for i = 1:4
   for j=1:nNodes
       point = [X(i,j); Y(i,j); Z(i,j)];
       temp = rotation(O(1), O(2), O(3))*point + P;
       X(i,j) = temp(1);
       Y(i,j) = temp(2);
       Z(i,j) = temp(3);
   end
end
surf(handles.axes,X,Y,Z,'FaceColor',color,'FaceAlpha',opa, 'EdgeColor','none');
end
