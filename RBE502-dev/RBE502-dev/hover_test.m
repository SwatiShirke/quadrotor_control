sys = drone_dynamics();

Ts = 0.1;
sys_d = c2d(sys,Ts);
Q = eye(12);
R = eye(4);
[K, S, e] = lqr(sys_d, Q, R);

z_desired = [0;2;3;0;0;0;0;0;0;0;0;0];
t = 0:Ts:10;
num_steps = length(t);
z = zeros(12,num_steps);
z(:,1) = [0;0;0;0;0;0;0;0;0;0;0;0];
d_error = @(A, B, K, error)(A - B*K)*error;
tspan = [0 0.1];
for k = 2:num_steps
    error = z(:, k-1) - z_desired ;
    [t1, error_int] = ode45(@(t1, error_int) d_error(sys_d.A, sys_d.B, K, error), tspan, error);
    z(:, k) = error_int(end,:)' + z_desired;
    
end
figure;
subplot(2,1,1);
plot(t, z(3, :), 'b-', t, z_desired(3)*ones(size(t)), 'r--');
title('Position (x)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position');

subplot(2,1,2);
plot(t, z(2, :), 'b-', t, z_desired(2)*ones(size(t)), 'r--');
title('Position (x)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position');
    
