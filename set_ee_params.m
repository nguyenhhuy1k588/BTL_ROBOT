function set_ee_params(scara, handles)
    set(handles.x_start, 'String', num2str(round(scara.end_effector(1), 4)));
    set(handles.y_start, 'String', num2str(round(scara.end_effector(2), 4)));
    set(handles.z_start, 'String', num2str(round(scara.end_effector(3), 4)));
    set(handles.roll_start, 'String', num2str(round(rad2deg(scara.end_effector(6)), 2)));
    set(handles.pitch_start, 'String', num2str(round(rad2deg(scara.end_effector(5)), 2)));
    set(handles.yaw_start, 'String', num2str(round(rad2deg(scara.end_effector(4)), 2)));
    set(handles.q1_text,'String',num2str(rad2deg(round(scara.theta(2),1))));
    set(handles.q2_text,'String',num2str(rad2deg(round(scara.theta(3), 1))));
    set(handles.q3_text,'String',num2str(round(scara.d(4), 1)));
    set(handles.q4_text,'String',num2str(rad2deg(round(scara.theta(5), 1))));
end