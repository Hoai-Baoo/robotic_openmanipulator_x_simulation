function draw_workspace(handles,mark)
d1 = 77;
a2 = sqrt(24^2 + 128^2);
a3 = 124;
a4 = 126;
Px = @(theta1,theta2,theta3,theta4)(cos(theta1).*(-a2*sin(theta2)+24*cos(theta2)+a3*cos(theta2+theta3)+a4*cos(theta2+theta3+theta4))); 
Py = @(theta1,theta2,theta3,theta4)(sin(theta1).*(-a2*sin(theta2)+24*cos(theta2)+a3*cos(theta2+theta3)+a4*cos(theta2+theta3+theta4))); 
Pz = @(theta1,theta2,theta3,theta4)(d1 + a2*cos(theta2)+24*sin(theta2)+a3*sin(theta2+theta3)+a4*sin(theta2+theta3+theta4));

TH1 = [];
TH2 = [];
TH3 = [];
TH4 = [];

for th1 = linspace(-pi,pi,20)
    for th2 = linspace(-pi/2,pi/2,5)
        for th3 = linspace(-pi/2,pi/2,5);
            for th4 = linspace(-pi/2,pi/2,5);
                TH1(end+1) = th1;
                TH2(end+1) = th2;
                TH3(end+1) = th3;
                TH4(end+1) = th4;
            end
        end
    end
end

x = Px(TH1,TH2,TH3,TH4);
y = Py(TH1,TH2,TH3,TH4);
z = Pz(TH1,TH2,TH3,TH4);

plot3(handles.axes,x,y,z,mark);
