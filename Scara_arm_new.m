function varargout = Scara_arm_new(varargin)
% SCARA_ARM_NEW MATLAB code for Scara_arm_new.fig
%      SCARA_ARM_NEW, by itself, creates a new SCARA_ARM_NEW or raises the existing
%      singleton*.
%
%      H = SCARA_ARM_NEW returns the handle to a new SCARA_ARM_NEW or the handle to
%      the existing singleton*.
%
%      SCARA_ARM_NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCARA_ARM_NEW.M with the given input arguments.
%
%      SCARA_ARM_NEW('Property','Value',...) creates a new SCARA_ARM_NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Scara_arm_new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Scara_arm_new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Scara_arm_new

% Last Modified by GUIDE v2.5 19-Apr-2022 13:38:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Scara_arm_new_OpeningFcn, ...
                   'gui_OutputFcn',  @Scara_arm_new_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Scara_arm_new is made visible.
function Scara_arm_new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Scara_arm_new (see VARARGIN)

% Choose default command line output for Scara_arm_new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global scara
a     = [0 4 2.5 0 0];
alpha = [0 0 180 0 0];
d     = [3.5 0 0 1 0];
theta = [0 0 0 0 0];
type = ['b', 'r', 'r', 'p', 'r'];
base = [0; 0; 0];
scara = Arm(a, alpha, d, theta, type, base);
scara = scara.set_joint_variable(2, deg2rad(get(handles.q1_slider, 'Value')));
scara = scara.set_joint_variable(3, deg2rad(get(handles.q2_slider, 'Value')));
scara = scara.set_joint_variable(4, get(handles.q3_slider, 'Value'));
scara = scara.set_joint_variable(5, deg2rad(get(handles.q4_slider, 'Value')));
scara = scara.update();
set_ee_params(scara, handles);
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));


% UIWAIT makes Scara_arm_new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Scara_arm_new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function q1_slider_Callback(hObject, eventdata, handles)
% hObject    handle to q1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(2, deg2rad(get(handles.q1_slider, 'Value')));
scara = scara.update();
set_ee_params(scara, handles);
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));

% --- Executes during object creation, after setting all properties.
function q1_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q2_slider_Callback(hObject, eventdata, handles)
% hObject    handle to q2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(3, deg2rad(get(handles.q2_slider, 'Value')));
scara = scara.update();
set_ee_params(scara, handles);
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));

% --- Executes during object creation, after setting all properties.
function q2_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q3_slider_Callback(hObject, eventdata, handles)
% hObject    handle to q3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(4, get(handles.q3_slider, 'Value'));
scara = scara.update();
set_ee_params(scara, handles);
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));

% --- Executes during object creation, after setting all properties.
function q3_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q4_slider_Callback(hObject, eventdata, handles)
% hObject    handle to q4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global scara
scara = scara.set_joint_variable(5, deg2rad(get(handles.q4_slider, 'Value')));
scara = scara.update();
set_ee_params(scara, handles);
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));

% --- Executes during object creation, after setting all properties.
function q4_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q4_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function q1_text_Callback(hObject, eventdata, handles)
% hObject    handle to q1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q1_text as text
%        str2double(get(hObject,'String')) returns contents of q1_text as a double


% --- Executes during object creation, after setting all properties.
function q1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q2_text_Callback(hObject, eventdata, handles)
% hObject    handle to q2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q2_text as text
%        str2double(get(hObject,'String')) returns contents of q2_text as a double


% --- Executes during object creation, after setting all properties.
function q2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q3_text_Callback(hObject, eventdata, handles)
% hObject    handle to q3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q3_text as text
%        str2double(get(hObject,'String')) returns contents of q3_text as a double


% --- Executes during object creation, after setting all properties.
function q3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q4_text_Callback(hObject, eventdata, handles)
% hObject    handle to q4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q4_text as text
%        str2double(get(hObject,'String')) returns contents of q4_text as a double


% --- Executes during object creation, after setting all properties.
function q4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in coords.
function coords_Callback(hObject, eventdata, handles)
% hObject    handle to coords (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of coords
global scara
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));

% --- Executes on button press in workspace.
function workspace_Callback(hObject, eventdata, handles)
% hObject    handle to workspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of workspace
global scara
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));


% --- Executes on button press in motion_btn.
function motion_btn_Callback(hObject, eventdata, handles)
% hObject    handle to motion_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scara

%get_param_invert(scara, handles);
dz = zeros(1,6);
dz(1) = str2double(get(handles.x_start, 'String'));
dz(2) = str2double(get(handles.y_start, 'String'));
dz(3) = str2double(get(handles.z_start, 'String'));
dz(4) = deg2rad(str2double(get(handles.roll_start, 'String')));
dz(5) = deg2rad(str2double(get(handles.pitch_start, 'String')));
dz(6) = deg2rad(str2double(get(handles.yaw_start, 'String')));

pf = zeros(1,6);
pf(1) = str2double(get(handles.x_end, 'String'));
pf(2) = str2double(get(handles.y_end, 'String'));
pf(3) = str2double(get(handles.z_end, 'String'));
pf(4) = deg2rad(str2double(get(handles.roll_end, 'String')));
pf(5) = deg2rad(str2double(get(handles.pitch_end, 'String')));
pf(6) = deg2rad(str2double(get(handles.yaw_end, 'String')));


joint = inverse_kinematics(scara.a, scara.alpha, scara.d, scara.theta, pf);
scara = scara.set_joint_variable(2, joint(1));
scara = scara.set_joint_variable(3, joint(2));
scara = scara.set_joint_variable(4, joint(3));
scara = scara.set_joint_variable(5, joint(4));
scara = scara.update();
set_joints_params(scara, handles);
set_ee_params(scara, handles);
scara.plot(handles.axes1, get(handles.coords,'Value'), get(handles.workspace,'Value'));
%set_ee_params(scara, handles);


function x_end_Callback(hObject, eventdata, handles)
% hObject    handle to x_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_end as text
%        str2double(get(hObject,'String')) returns contents of x_end as a double


% --- Executes during object creation, after setting all properties.
function x_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_end_Callback(hObject, eventdata, handles)
% hObject    handle to y_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_end as text
%        str2double(get(hObject,'String')) returns contents of y_end as a double


% --- Executes during object creation, after setting all properties.
function y_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_end_Callback(hObject, eventdata, handles)
% hObject    handle to z_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_end as text
%        str2double(get(hObject,'String')) returns contents of z_end as a double


% --- Executes during object creation, after setting all properties.
function z_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function roll_end_Callback(hObject, eventdata, handles)
% hObject    handle to roll_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roll_end as text
%        str2double(get(hObject,'String')) returns contents of roll_end as a double


% --- Executes during object creation, after setting all properties.
function roll_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roll_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pitch_end_Callback(hObject, eventdata, handles)
% hObject    handle to pitch_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pitch_end as text
%        str2double(get(hObject,'String')) returns contents of pitch_end as a double


% --- Executes during object creation, after setting all properties.
function pitch_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pitch_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yaw_end_Callback(hObject, eventdata, handles)
% hObject    handle to yaw_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yaw_end as text
%        str2double(get(hObject,'String')) returns contents of yaw_end as a double


% --- Executes during object creation, after setting all properties.
function yaw_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yaw_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
