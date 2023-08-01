function p2p_trajectory(handles, theta, opa, A_pos, B_pos, pmax, vmax, amax)
N = 1000;
a = zeros(N,1);
v = zeros(N,1);
p = zeros(N,1);

xA = A_pos(1);
yA = A_pos(2);
zA = A_pos(3);
xB = B_pos(1);
yB = B_pos(2);
zB = B_pos(3);

t1 = vmax/amax
t2 = pmax/vmax
t3 = t1+t2

T = linspace(0,t3,N);
m = linspace(0,1,1000);

grid(handles.axes_p,'on');
axis(handles.axes_p,'tight');
grid(handles.axes_v,'on');
axis(handles.axes_v,'tight');
grid(handles.axes_a,'on');
axis(handles.axes_a,'tight');

for i=1:N
    t = T(i);
    if (t <=  t1)
        a(i) = amax;
        v(i) = amax*t;
        p(i) = 1/2*amax*t^2;
    elseif (t > t1 && t <= t2)
        t = t - t1;
        a(i) = 0;
        v(i) = vmax;
        p(i) = 1/2*amax*t1^2 + vmax*t;
    elseif (t > t2 && t <= t3)
        t = t - t2;
        a(i) = -amax;
        v(i) = vmax - amax*t;
        p(i) = 1/2*amax*t1^2 + vmax*(t2-t1) + vmax*t - 1/2*amax*t^2;
    end
    
    x = xA + (xB-xA)*m(i)
    y = yA + (yB-yA)*m(i)
    z = zA + (zB-zA)*m(i)
    pit = 0;
    theta = inverse_calc(x,y,z,pit)
    
    hold on;
    plot(handles.axes_p,T,p,'r','LineWidth',2);
    plot(handles.axes_v,T,v,'g','LineWidth',2);
    plot(handles.axes_a,T,a,'b','LineWidth',2);
end


    
    

end

