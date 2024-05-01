function [value, isterminal, direction] = captured(s)
b = s(13:15);
x = s(1:3);
params = system_parameters();
e = params.l/2;
if norm(b-x) < e
    value = norm(b-x);
    isterminal = 1;
    direction = 0;
end
end
