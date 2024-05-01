function [z]= back_to_home_position(s,s_init,A,B,Q,R,K,r,n)
z_current = s(1:12);
z_d = s_init(1:12);         %
t_span = [0 100];
%% if bug or UAV is out of the space, then return back to home position
[t,z] = ode45(@(t,z) quadrotor_with_control(z,z_d, r, n,K), t_span, z_current);
z;
end