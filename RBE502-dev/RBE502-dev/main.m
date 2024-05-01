clear; clc; close all;
disp("here....")
x_lim = 10;
y_lim = 10; 
z_lim = 10;
Q = eye(12)*2;
R = eye(4);

%%control and system dynamics
[A,B] = linearized_dynamics();
[K, ~, ~] = lqr(A, B, Q, R);
z_init = [0;0;0;0;0;0; 0;0;0; 0;0;0 ]; %%%%%%%%%%%%% zeros(12,1)
b_init = [0;0;4];%%%%%%%%%%%%%%%%%
t_span = [0 20];
r = zeros(3,1);
n = zeros(3,1);
s_init = vertcat(z_init, b_init);
s_init;
e =2;
%%catch the bug
options = odeset("Events", @(t,s)check_bug_bounds(s,x_lim,y_lim, z_lim,e));
[t,s, t_dash, s_dash, ie] = ode45(@(t,s) combined_dynamics(s, r, n, K, t), t_span, s_init, options);
%[t,s, t_dash] = ode45(@(t,s) combined_dynamics(s, r, n, K, t), t_span, s_init);
s(end,:);
ie

figure;
x_uav = s(:,1);
y_uav = s(:,2);
z_uav = s(:,3);
plot3(x_uav,y_uav,z_uav);
hold on;
x_bug = s(:,13);
y_bug = s(:,14);
z_bug = s(:,15);
plot3(x_bug,y_bug,z_bug);
% %%%
% error = sqrt ((x_uav - x_bug).^2 + (y_uav - y_bug).^2 + (z_uav - z_bug).^2)
% error = sum( error , "all" )
xlabel("x");
ylabel("y");
zlabel("z");

%%hover to stabilize s
s_current = s(end, :);
z_current = s_current(1:12);
z_hover = [z_current(1:3)'; zeros(9,1)];
t_span = [0 5];
[t,z] = ode45(@(t,z) quadrotor_with_control(z,z_hover, r, n,K), t_span, z_current);

%%%%
z = z(end,:);
z = transpose(z);
z =  back_to_home_position(z,s_init,A,B,Q,R,K,r,n);
z(end,:);
hold on;
plot3(z(:,1),z(:,2),z(:,3),'g');
axis([0 10 0 10 0 10])
