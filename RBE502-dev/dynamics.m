function dz = dynamics(z, u, r, n)
%{
state vector = [x, y, z, r, p, y, xdot, ydot, zdot, rdot, pdot, ydot]
control vector = motor inputs to all 4 rotors 
r = external force vector
n = external moment vector
%}
params = system_parameters();
c_1 = [1;0;0];
c_2 = [0;1;0];
c_3 = [0;0;1];
I = diag([params.i11, params.i22, params.i33]);

R_3 = @(psi)[cos(psi), -sin(psi), 0; sin(psi), cos(psi), 0; 0, 0, 1];
R_2 = @(theta)[cos(theta), 0, sin(theta); 0,1,0; -sin(theta), 0, cos(theta)];
R_1 = @(phi)[1, 0, 0; 0, cos(phi), -sin(phi); 0, sin(phi), cos(phi)];

r_ce = @(alpha)R_3(alpha(3))* R_2(alpha(2))* R_1(alpha(1)) ;
t_inv = @(alpha)[1, sin(alpha(1))*tan(alpha(2)), cos(alpha(1))*tan(alpha(2));
    0, cos(alpha(1)), -sin(alpha(1)); 0, sin(alpha(1))/cos(alpha(2)), cos(alpha(1))/cos(alpha(2))];

v = z(7:9);
alpha = z(4:6);
w = z(10:12);

%limiting the value of u as per max thrust

u = max(min(u, params.mu), 0);
dx = v;
dalpha = t_inv(alpha)*w;
dv = - params.g * c_3 + 1/params.m*r_ce(alpha)*(u(1) + u(2) + u(3) + u(4))*c_3 + 1/params.m*r_ce(alpha)*r;
dw = I\((u(2) - u(4))*params.l*c_1 + (u(3) - u(1))*params.l*c_2 + (u(1) - u(2) + u(3) - u(4))*params.sigma*c_3 + n - cross(w, I*w));

dz = [dx;dalpha;dv;dw];
end
