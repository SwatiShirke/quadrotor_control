function [value, isterminal, direction] = check_bug_bounds(s,x_lim,y_lim, z_lim,e)
%environment dimensions are within -x_lim & x_lim and so on
value = 0;
isterminal = 0;
direction = 0;
b = s(13:15);
x = s(1:3);
params = system_parameters();
%e = params.l/2;
%e = 5;

if b(1) > x_lim || b(1) < -x_lim || b(2) > y_lim || b(2) < -y_lim || b(3) > z_lim || b(3) < -z_lim
     value = [norm(b-x); 0;0];
     isterminal = [1;0;0];
     direction = [0;0;0];
     disp("Bug escaped the space!");

elseif x(1) > x_lim || x(1) < -x_lim || x(2) > y_lim || x(2) < -y_lim || x(3) > z_lim || x(3) < -z_lim
    value = [0;norm(b-x) ;0];
    isterminal = [0;1;0];
    direction = [0;0;0];
    disp("UAV escaped the space!");

elseif norm(b-x) < e
    value = [0; 0; norm(b-x)];
    isterminal = [0;0;1];
    direction = [0;0;0];
    disp("cathed the bug!!!");
    
end 


% if norm(b-x) < e
%     value = 10;
%     isterminal = 1;
%     direction = 0;    
% end 

end