function [t,z]= back_to_home_position(s,s_init,A,B,Q,R,K,r,n,ie)
z_current = s(1:12);
z_d = s_init(1:12);         %
t_span = [0 20];
%% if bug or UAV is out of the space, then return back to home position
if ie==1 
    [t,z] = ode45(@(t,z) quadrotor_with_control(z,z_d, r, n,K), t_span, z_current);    
else
    %%add distrubances 
    % r = [0;0;0];
    % n = [0;0;0];
    [A B] = linearized_noisy_dynamics(r);
    K
    [K, ~, ~] = lqr(A, B, Q, R);
    K
    [t,z] = ode45(@(t,z) quadrotor_with_control(z,z_d, r, n,K), t_span, z_current);

end