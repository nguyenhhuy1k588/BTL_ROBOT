function get_param_invert(scara, handles)
p0 = zeros(1, 6);
p0(1) = str2double(get(handles.x_start, 'String'));
p0(2) = str2double(get(handles.y_start, 'String'));
p0(3) = str2double(get(handles.z_start, 'String'));
p0(4) = deg2rad(str2double(get(handles.roll_start, 'String')));
p0(5) = deg2rad(str2double(get(handles.pitch_start, 'String')));
p0(6) = deg2rad(str2double(get(handles.yaw_start, 'String')));

pf = zeros(1, 6);
pf(1) = str2double(get(handles.x_end, 'String'));
pf(2) = str2double(get(handles.y_end, 'String'));
pf(3) = str2double(get(handles.z_end, 'String'));
pf(4) = deg2rad(str2double(get(handles.roll_end, 'String')));
pf(5) = deg2rad(str2double(get(handles.pitch_end, 'String')));
pf(6) = deg2rad(str2double(get(handles.yaw_end, 'String')));