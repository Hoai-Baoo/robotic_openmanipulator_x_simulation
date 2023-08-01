
function varargout = GUIDE(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIDE_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIDE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% --- Executes just before GUIDE is made visible.
function GUIDE_OpeningFcn(hObject, eventdata, handles, varargin)
%init.
global theta;
global opa;
handles.output = hObject;
handles.output = hObject;

cla(handles.axes,'reset');
hold(handles.axes,'on');
grid(handles.axes,'on');
view(handles.axes,[20,20]);

set(handles.slider_theta1, 'Max', 180);
set(handles.slider_theta1, 'Min', -180);
set(handles.slider_theta1, 'SliderStep' , [1, 1] / 20 );
set(handles.slider_theta1,'Value',0);

set(handles.slider_theta2, 'Max', 90);
set(handles.slider_theta2, 'Min', -90);
set(handles.slider_theta2, 'SliderStep' , [1, 1] / 20 );
set(handles.slider_theta2,'Value',0);

set(handles.slider_theta3, 'Max', 90);
set(handles.slider_theta3, 'Min', -90);
set(handles.slider_theta3, 'SliderStep' , [1, 1] / 20 );
set(handles.slider_theta3,'Value',0);

set(handles.slider_theta4, 'Max', 90);
set(handles.slider_theta4, 'Min', -90);
set(handles.slider_theta4, 'SliderStep' , [1, 1] / 20 );
set(handles.slider_theta4,'Value',0);

set(handles.edit_theta1,'String',0);
set(handles.edit_theta2,'String',0);
set(handles.edit_theta3,'String',0);
set(handles.edit_theta4,'String',0);
theta = [0 0 0 0];
opa = 0.5;
draw_robot(handles, theta, opa);


% Update handles structure
guidata(hObject, handles);

function varargout = GUIDE_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



% --- Executes on slider movement.
function slider_theta1_Callback(hObject, eventdata, handles)
global theta;
global opa;

theta1 = get(handles.slider_theta1,'Value');
theta(1) = theta1;
set(handles.edit_theta1,'String',num2str(theta1));

draw_robot(handles, theta, opa);

function slider_theta1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function mypostcallback(obj,evd)
newView = round(handles.axes.View);

% --- Executes on slider movement.
function slider_theta2_Callback(hObject, eventdata, handles)
global theta;
global opa;

theta2 = get(handles.slider_theta2,'Value');
set(handles.edit_theta2,'String',num2str(theta2));
theta(2) = theta2;
draw_robot(handles, theta, opa);
% --- Executes during object creation, after setting all properties.
function slider_theta2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_theta3_Callback(hObject, eventdata, handles)
global theta;
global opa;

theta3 = get(handles.slider_theta3,'Value');
set(handles.edit_theta3,'String',num2str(theta3));
theta(3) = theta3;
draw_robot(handles, theta, opa);
% --- Executes during object creation, after setting all properties.
function slider_theta3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_theta4_Callback(hObject, eventdata, handles)
global theta;
global opa;

theta4 = get(handles.slider_theta4,'Value');
set(handles.edit_theta4,'String',num2str(theta4));
theta(4) = theta4;
draw_robot(handles, theta, opa);
% --- Executes during object creation, after setting all properties.
function slider_theta4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_opa_Callback(hObject, eventdata, handles)
global opa;
global theta;
opa = get(handles.slider_opa,'Value');
draw_robot(handles, theta, opa); 


% --- Executes during object creation, after setting all properties.
function slider_opa_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in checkbox_coor0.
function checkbox_coor0_Callback(hObject, eventdata, handles)
global theta;
global opa;
draw_robot(handles, theta, opa);
% --- Executes on button press in checkbox_coor1.
function checkbox_coor1_Callback(hObject, eventdata, handles)
global theta;
global opa;
draw_robot(handles, theta, opa);


% --- Executes on button press in checkbox_coor1_.
function checkbox_coor1__Callback(hObject, eventdata, handles)
global theta;
global opa;
draw_robot(handles, theta, opa);
% --- Executes on button press in checkbox_coor2.
function checkbox_coor2_Callback(hObject, eventdata, handles)
global theta;
global opa;
draw_robot(handles, theta, opa);
% --- Executes on button press in checkbox_coor3.
function checkbox_coor3_Callback(hObject, eventdata, handles)
global theta;
global opa;
draw_robot(handles, theta, opa);

% --- Executes on button press in checkbox_coor4.
function checkbox_coor4_Callback(hObject, eventdata, handles)
global theta;
global opa;
draw_robot(handles, theta, opa);




function edit_emitter_X_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_emitter_X_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_emitter_Y_Callback(hObject, eventdata, handles)

function edit_emitter_Y_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_emitter_Z_Callback(hObject, eventdata, handles)

function edit_emitter_Z_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_emitter_Roll_Callback(hObject, eventdata, handles)

function edit_emitter_Roll_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_emitter_Pitch_Callback(hObject, eventdata, handles)

function edit_emitter_Pitch_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_emitter_Yaw_Callback(hObject, eventdata, handles)

function edit_emitter_Yaw_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_theta1 as text
%        str2double(get(hObject,'String')) returns contents of edit_theta1 as a double


% --- Executes during object creation, after setting all properties.
function edit_theta1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit_theta2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta3_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit_theta3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_theta4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_theta4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_inverse.
function pushbutton_inverse_Callback(hObject, eventdata, handles)
global theta;
global opa;
Px = str2double(get(handles.edit_Inverse_X,'String'));
Py = str2double(get(handles.edit_Inverse_Y,'String'));
Pz = str2double(get(handles.edit_Inverse_Z,'String'));
Pit = -str2double(get(handles.edit_Inverse_Pitch,'String'))*pi/180;

d1 = 77;
a2 = sqrt(24^2 + 128^2);
a3 = 124;
a4 = 126;


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
        move_inv(handles, theta, opa);
        set(handles.text_notification,'String',"Done",'ForegroundColor','g');  
    else
        theta = [0 0 0 0];
        draw_robot(handles, theta, opa);
        set(handles.text_notification,'String',"Out of work space!!",'ForegroundColor','r');
    end
else
    theta = [0 0 0 0];
    draw_robot(handles, theta, opa);
    set(handles.text_notification,'String',"Out of work space!!",'ForegroundColor','r');
end



% --- Executes on button press in pushbutton_direct.
function pushbutton_direct_Callback(hObject, eventdata, handles)
global theta;
global opa;
theta1_edit = str2double(get(handles.edit_theta1,'String'));
theta2_edit = str2double(get(handles.edit_theta2,'String'));
theta3_edit = str2double(get(handles.edit_theta3,'String'));
theta4_edit = str2double(get(handles.edit_theta4,'String'));

move(handles, theta, opa);



function edit_Inverse_X_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Inverse_X as text
%        str2double(get(hObject,'String')) returns contents of edit_Inverse_X as a double


% --- Executes during object creation, after setting all properties.
function edit_Inverse_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Inverse_Y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Inverse_Y as text
%        str2double(get(hObject,'String')) returns contents of edit_Inverse_Y as a double


% --- Executes during object creation, after setting all properties.
function edit_Inverse_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Inverse_Z_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Inverse_Z as text
%        str2double(get(hObject,'String')) returns contents of edit_Inverse_Z as a double


% --- Executes during object creation, after setting all properties.
function edit_Inverse_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Inverse_Pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_Pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Inverse_Pitch as text
%        str2double(get(hObject,'String')) returns contents of edit_Inverse_Pitch as a double


% --- Executes during object creation, after setting all properties.
function edit_Inverse_Pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Inverse_Pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta;
global opa;
theta = [0;0;0;0];
set(handles.slider_theta1,'Value',0);
set(handles.slider_theta2,'Value',0);
set(handles.slider_theta3,'Value',0);
set(handles.slider_theta4,'Value',0);
set(handles.edit_theta1,'String',0);
set(handles.edit_theta2,'String',0);
set(handles.edit_theta3,'String',0);
set(handles.edit_theta4,'String',0);
set(handles.text_notification,'String',"",'ForegroundColor','g');
draw_robot(handles, theta, opa);


% --- Executes on button press in checkbox_workspace.
function checkbox_workspace_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_workspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global theta;
global opa;
draw_robot(handles,theta,opa);
% Hint: get(hObject,'Value') returns toggle state of checkbox_workspace


% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
global theta;
global opa;
xA = str2double(get(handles.edit_xA,'String'));
yA = str2double(get(handles.edit_yA,'String'));
zA = str2double(get(handles.edit_zA,'String'));
pitA =  str2double(get(handles.edit_pitA,'String'))*pi/180;

xB = str2double(get(handles.edit_xB,'String'));
yB = str2double(get(handles.edit_yB,'String'));
zB = str2double(get(handles.edit_zB,'String'));
pitB = str2double(get(handles.edit_pitB,'String'))*pi/180;

vmax = str2double(get(handles.edit_vmax,'String'));
amax = str2double(get(handles.edit_amax,'String'));

X = [];
Y = [];
Z = [];

TH1 = [];
TH2 = [];
TH3 = [];
TH4 = [];
dTH1 = [];
dTH2 = [];
dTH3 = [];
dTH4 = [];

a2 = sqrt(128^2+24^2);
a3 = 124;
a4 = 126;
th0 = pi/2-atan(24/128);
J = @(th1, th2, th3, th4)([-sin(th1)*(a2*cos(th0 + th2) + a3*cos(th2 + th3) + a4*cos(th2 + th3 + th4)), -cos(th1)*(a2*sin(th0 + th2) + a3*sin(th2 + th3) + a4*sin(th2 + th3 + th4)), -cos(th1)*(a3*sin(th2 + th3) + a4*sin(th2 + th3 + th4)), -a4*sin(th2 + th3 + th4)*cos(th1);
                            cos(th1)*(a2*cos(th0 + th2) + a3*cos(th2 + th3) + a4*cos(th2 + th3 + th4)), -sin(th1)*(a2*sin(th0 + th2) + a3*sin(th2 + th3) + a4*sin(th2 + th3 + th4)), -sin(th1)*(a3*sin(th2 + th3) + a4*sin(th2 + th3 + th4)), -a4*sin(th2 + th3 + th4)*sin(th1);
                                                                                     0,             a2*cos(th0 + th2) + a3*cos(th2 + th3) + a4*cos(th2 + th3 + th4),             a3*cos(th2 + th3) + a4*cos(th2 + th3 + th4),           a4*cos(th2 + th3 + th4);
                                                                                     0,                                                                    sin(th1),                                                sin(th1),                          sin(th1)]);

N = 100;
a = zeros(N,1);
v = zeros(N,1);
p = zeros(N,1);

if (get(handles.checkbox_circle, 'Value')==0)
%---------------------------------------------------Linear-----------------------------------------------
%Vector chi phuong
u = [(xB-xA); (yB-yA); (zB-zA)];
pmax = sqrt(u(1)^2 + u(2)^2 + u(3)^2);

t1 = vmax/amax;
t2 = pmax/vmax;
t3 = t1+t2;
T = linspace(0,t3,N);

vpmax = abs(pitB-pitA)/t2;
apmax = vpmax/t1;

for i=1:N
    t = T(i);
    if (t <=  t1)
        a(i) = amax;
        v(i) = amax*t;
        p(i) = 1/2*amax*t^2;
        
        vpit = apmax*t;
        pit = pitA + 1/2*apmax*t^2;
    elseif (t > t1 && t <= t2)
        t = t - t1;
        a(i) = 0;
        v(i) = vmax;
        p(i) = 1/2*amax*t1^2 + vmax*t;
        
        vpit = vpmax;
        pit = pitA + 1/2*apmax*t1^2 + vpmax*t;
    elseif (t > t2 && t <= t3)
        t = t - t2;
        a(i) = -amax;
        v(i) = vmax - amax*t;
        p(i) = 1/2*amax*t1^2 + vmax*(t2-t1) + vmax*t - 1/2*amax*t^2;
        
        vpit = vpmax - apmax*t;
        pit = pitA + 1/2*apmax*t1^2 + vpmax*(t2-t1) + vpmax*t - 1/2*apmax*t^2;
    end
    
    x = xA + u(1)*p(i)/pmax;
    y = yA + u(2)*p(i)/pmax;
    z = zA + u(3)*p(i)/pmax;
    
    vx = u(1)*v(i)/pmax;
    vy = u(2)*v(i)/pmax;
    vz = u(3)*v(i)/pmax;
    
    thetaJ = inverse_calc(handles, x,y,z,pit)*pi/180;
    if (length(thetaJ) == 4) 
    th1 = thetaJ(1);
    th2 = thetaJ(2);
    th3 = thetaJ(3);
    th4 = thetaJ(4);
    else 
        break;
    end
    
    X(end+1) = x;
    Y(end+1) = y;
    Z(end+1) = z;
    
    TH1(end+1) = th1;
    TH2(end+1) = th2;
    TH3(end+1) = th3;
    TH4(end+1) = th4;

    J4 = J(th1,th2,th3,th4);
    dth = J4\[vx; vy; vz; sin(th1)*-vpit];
    dTH1(end+1) = dth(1);
    dTH2(end+1) = dth(2);
    dTH3(end+1) = dth(3);
    dTH4(end+1) = dth(4);
end

%---------------------------------------------------Circle-----------------------------------------------
elseif (get(handles.checkbox_circle, 'Value')==1)
RA = sqrt((xA)^2 + (yA)^2 + (zA)^2);
RB = sqrt((xB)^2 + (yB)^2 + (zB)^2);
phiA = atan2(yA,xA);
phiB = atan2(yB,xB);
thA = acos(zA/sqrt(xA^2+yA^2+zA^2));
thB = acos(zB/sqrt(xB^2+yB^2+zB^2));

if (RA==RB)
pmax = abs(phiB-phiA)*RA

t1 = vmax/amax;
t2 = pmax/vmax;
t3 = t1+t2;
T = linspace(0,t3,N);

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
    
    R = RA + (RB-RA)*p(i)/pmax;
    phi = phiA + (phiB-phiA)*p(i)/pmax;
    th = thA + (thB-thA)*p(i)/pmax;
    x=R*cos(phi)*sin(th);
    y=R*sin(phi)*sin(th);
    z=R*cos(th);
    
    pit = 0;
    
    vx=R*-sin(phi)*(phiB-phiA)*v(i)/pmax;
    vy=R*cos(phi)*(phiB-phiA)*v(i)/pmax;
    vz=0;
    
    thetaJ = inverse_calc(handles, x,y,z,pit)*pi/180;
    if (length(thetaJ) == 4) 
    th1 = thetaJ(1);
    th2 = thetaJ(2);
    th3 = thetaJ(3);
    th4 = thetaJ(4);
    else 
        break;
    end
    X(end+1) = x;
    Y(end+1) = y;
    Z(end+1) = z;
    
    TH1(end+1) = th1;
    TH2(end+1) = th2;
    TH3(end+1) = th3;
    TH4(end+1) = th4;
    
    J4 = J(th1,th2,th3,th4);
    dth = J4\[vx; vy; vz; 0];
    dTH1(end+1) = dth(1);
    dTH2(end+1) = dth(2);
    dTH3(end+1) = dth(3);
    dTH4(end+1) = dth(4);        
end
end

end
%Draw
for i=1:N
    theta = [TH1(i) TH2(i) TH3(i) TH4(i)].*180/pi;
    set(handles.edit_theta1,'String',theta(1));
    set(handles.edit_theta2,'String',theta(2));
    set(handles.edit_theta3,'String',theta(3));
    set(handles.edit_theta4,'String',theta(4));
    draw_robot(handles, theta, opa);
    
    plot3(handles.axes,X(1:i),Y(1:i),Z(1:i),'r-','LineWidth',3);

    plot(handles.axes_p,T(1:i),p(1:i),'r','LineWidth',2);
    plot(handles.axes_v,T(1:i),v(1:i),'g','LineWidth',2);
    plot(handles.axes_a,T(1:i),a(1:i),'b','LineWidth',2);
    
    plot(handles.axes_theta1,T(1:i),TH1(1:i).*180/pi,'b','LineWidth',2);
    plot(handles.axes_theta2,T(1:i),TH2(1:i).*180/pi,'b','LineWidth',2);
    plot(handles.axes_theta3,T(1:i),TH3(1:i).*180/pi,'b','LineWidth',2);
    plot(handles.axes_theta4,T(1:i),TH4(1:i).*180/pi,'b','LineWidth',2);

    plot(handles.axes_theta1dot,T(1:i),dTH1(1:i).*180/pi,'g','LineWidth',2);
    plot(handles.axes_theta2dot,T(1:i),dTH2(1:i).*180/pi,'g','LineWidth',2);
    plot(handles.axes_theta3dot,T(1:i),dTH3(1:i).*180/pi,'g','LineWidth',2);
    plot(handles.axes_theta4dot,T(1:i),dTH4(1:i).*180/pi,'g','LineWidth',2);
    
    pause(0.0000001);
end

legend(handles.axes_p,'p');
grid(handles.axes_p,'on');
xlabel(handles.axes_p,'t');
ylabel(handles.axes_p,'p');
xlim(handles.axes_p,[0 t3]);
ylim(handles.axes_p,[0 pmax]);

legend(handles.axes_v,'v');
grid(handles.axes_v,'on');
xlabel(handles.axes_v,'t');
ylabel(handles.axes_v,'v');
xlim(handles.axes_v,[0 t3]);
ylim(handles.axes_v,[0 vmax]);

legend(handles.axes_a,'a');
grid(handles.axes_a,'on');
xlabel(handles.axes_a,'t');
ylabel(handles.axes_a,'a');
xlim(handles.axes_a,[0 t3]);
ylim(handles.axes_a,[-amax amax]);

legend(handles.axes_theta1,'theta1');
grid(handles.axes_theta1,'on');
xlabel(handles.axes_theta1,'t');
ylabel(handles.axes_theta1,'theta1');
xlim(handles.axes_theta1,[0 t3]);
ylim(handles.axes_theta1,[-180 180]);

legend(handles.axes_theta2,'theta2');
grid(handles.axes_theta2,'on');
xlabel(handles.axes_theta2,'t');
ylabel(handles.axes_theta2,'theta2');
xlim(handles.axes_theta2,[0 t3]);
ylim(handles.axes_theta2,[-90 90]);

legend(handles.axes_theta3,'theta3');
grid(handles.axes_theta3,'on');
xlabel(handles.axes_theta3,'t');
ylabel(handles.axes_theta3,'theta3');
xlim(handles.axes_theta3,[0 t3]);
ylim(handles.axes_theta3,[-90 90]);


legend(handles.axes_theta4,'theta4');
grid(handles.axes_theta4,'on');
xlabel(handles.axes_theta4,'t');
ylabel(handles.axes_theta4,'theta4');
xlim(handles.axes_theta4,[0 t3]);
ylim(handles.axes_theta4,[-90 90]);

legend(handles.axes_theta1dot,'theta1dot');
grid(handles.axes_theta1dot,'on');
xlabel(handles.axes_theta1dot,'t');
ylabel(handles.axes_theta1dot,'theta1dot');
xlim(handles.axes_theta1dot,[0 t3]);

legend(handles.axes_theta2dot,'theta2dot');
grid(handles.axes_theta2dot,'on');
xlabel(handles.axes_theta2dot,'t');
ylabel(handles.axes_theta2dot,'theta2dot');
xlim(handles.axes_theta2dot,[0 t3]);

legend(handles.axes_theta3dot,'theta3dot');
grid(handles.axes_theta3dot,'on');
xlabel(handles.axes_theta3dot,'t');
ylabel(handles.axes_theta3dot,'theta3dot');
xlim(handles.axes_theta3dot,[0 t3]);

legend(handles.axes_theta4dot,'theta4dot');
grid(handles.axes_theta4dot,'on');
xlabel(handles.axes_theta4dot,'t');
ylabel(handles.axes_theta4dot,'theta4dot');
xlim(handles.axes_theta4dot,[0 t3]);


function edit_pitB_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pitB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pitB as text
%        str2double(get(hObject,'String')) returns contents of edit_pitB as a double


% --- Executes during object creation, after setting all properties.
function edit_pitB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pitB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_zB_Callback(hObject, eventdata, handles)
% hObject    handle to edit_zB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_zB as text
%        str2double(get(hObject,'String')) returns contents of edit_zB as a double


% --- Executes during object creation, after setting all properties.
function edit_zB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_yB_Callback(hObject, eventdata, handles)
% hObject    handle to edit_yB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_yB as text
%        str2double(get(hObject,'String')) returns contents of edit_yB as a double


% --- Executes during object creation, after setting all properties.
function edit_yB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_yB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_xB_Callback(hObject, eventdata, handles)
% hObject    handle to edit_xB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_xB as text
%        str2double(get(hObject,'String')) returns contents of edit_xB as a double


% --- Executes during object creation, after setting all properties.
function edit_xB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_xB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_xA_Callback(hObject, eventdata, handles)
% hObject    handle to edit_xA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_xA as text
%        str2double(get(hObject,'String')) returns contents of edit_xA as a double


% --- Executes during object creation, after setting all properties.
function edit_xA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_xA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_yA_Callback(hObject, eventdata, handles)
% hObject    handle to edit_yA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_yA as text
%        str2double(get(hObject,'String')) returns contents of edit_yA as a double


% --- Executes during object creation, after setting all properties.
function edit_yA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_yA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_zA_Callback(hObject, eventdata, handles)
% hObject    handle to edit_zA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_zA as text
%        str2double(get(hObject,'String')) returns contents of edit_zA as a double


% --- Executes during object creation, after setting all properties.
function edit_zA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pitA_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pitA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pitA as text
%        str2double(get(hObject,'String')) returns contents of edit_pitA as a double


% --- Executes during object creation, after setting all properties.
function edit_pitA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pitA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vmax as text
%        str2double(get(hObject,'String')) returns contents of edit_vmax as a double


% --- Executes during object creation, after setting all properties.
function edit_vmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_amax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amax as text
%        str2double(get(hObject,'String')) returns contents of edit_amax as a double


% --- Executes during object creation, after setting all properties.
function edit_amax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_circle.
function checkbox_circle_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_circle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_circle


% --- Executes on button press in checkbox_singularity.
function checkbox_singularity_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_singularity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_singularity
