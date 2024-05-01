function [value, isterminal, direction] = check_uav_bounds(s)

%environment dimensions are within -x_lim & x_lim and so on
x_lim = 5;
y_lim = 5; 
z_lim = 5;
x = s(1:3);

if x(1) > x_lim || x(1) < -x_lim || x(2) > y_lim || x(2) < -y_lim || x(3) > z_lim || x(3) < -z_lim
    value = norm(b-x);
    isterminal = 1;
    direction = 0;
end
end
