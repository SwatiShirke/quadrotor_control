clear; clc; close all;
x_lim = 10;
y_lim = 10; 
z_lim = 10;
Q = eye(12)*0.5;
R = eye(4);
%%control and system dynamics
[A,B] = linearized_dynamics();
[K, ~, ~] = lqr(A, B, Q, R);
z_init = [0;0;0;0;0;0; 0;0;0; 0;0;0]; 
b_init = [0;0;4];
t_span = [0 20];
r = zeros(3,1);
n = zeros(3,1);
s_init = vertcat(z_init, b_init);
%%catch the bug
options = odeset("Events", @(t,s)captured(s,x_lim,y_lim, z_lim));
[t1,s, t_dash, s_dash, ie] = ode45(@(t,s) combined_dynamics(s, r, n, K, t), t_span, s_init, options);
% plot_trajectories(s,t);
t1;
ie;
%%return back to origin
z = s(end,:);
z = transpose(z);
z_desired = s_init(1:12);
[t2, z] = back_to_home_position(z,z_desired,A,B,Q,R,K,r,n,ie);
plot_graphs(s,t1, A,B,K);
plot_trajectories(s,t1,z,t2);
%animate2d(t1,s,"error_graphs.gif");
%animate2d_x(t1, s, "x_graphs");










