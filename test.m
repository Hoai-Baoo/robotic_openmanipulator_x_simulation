cla reset

Start = [100;400;100]
End = [100;300;0]
u = [End(1) - Start(1); End(2) - Start(2); End(3) - Start(3)];

pmax = sqrt(u(1)^2 + u(2)^2 + u(3)^2);
vmax = 40;
amax = 20;

N = 1000;
a = zeros(N,1);
v = zeros(N,1);
p = zeros(N,1);


t1 = vmax/amax
t2 = pmax/vmax
t3 = t1+t2

X = [];
Y = [];
Z = [];

T = linspace(0,t3,N);
for i=2:N
    t = T(i)
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
    
    x = Start(1) + u(1)*p(i)/pmax;
    y = Start(2) + u(2)*p(i)/pmax;
    z = Start(3) + u(3)*p(i)/pmax; 
    
    X(end+1) = x;
    Y(end+1) = y;
    Z(end+1) = z;
        
end


hold on;
grid on;

xlim([0 t3]);
ylim([0, pmax]);
plot(T,a,'r');
plot(T,v,'g');
plot(T,p,'b');

figure();
plot3(X,Y,Z,'y-');

