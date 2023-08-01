function R = rotation(Roll,Pitch, Yaw)
R = [cos(Yaw)*cos(Pitch)    cos(Yaw)*sin(Pitch)*sin(Roll)-sin(Yaw)*cos(Roll)  cos(Yaw)*sin(Pitch)*cos(Roll)+sin(Yaw)*sin(Roll);
     sin(Yaw)*cos(Pitch)    sin(Yaw)*sin(Pitch)*sin(Roll)+cos(Yaw)*cos(Roll)  sin(Yaw)*sin(Pitch)*cos(Roll)-cos(Yaw)*sin(Roll);
    -sin(Pitch)             cos(Pitch)*sin(Roll)                              cos(Pitch)*cos(Roll)                           ];
end

