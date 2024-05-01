[A,B] = linearized_dynamics();
Q = eye(12)*2;
R = eye(4);
[K, S, e] = lqr(A, B, Q, R);

z_desired = [5;5;5;0;0;0;0;0;0;0;0;0];
Ts=0.1;
t = 0:Ts:100;
num_steps = length(t);
z = zeros(12,num_steps);
z(:,1) = [0; 0; 0; 0;0;0;0;0;0;0.0;0.0;0.0];
%z(:,1) = [5; 5; 5; 0;0;0;0;0;0;0;0;0];
r = zeros(3,1);
n = zeros(3,1);
params = system_parameters();
ud = [1;1;1;1]*params.m*params.g/4;
for k = 2:num_steps
    error = z(:, k-1) - z_desired ;
    
    %%error_matrix(:,k) =  error;
    u = ud + -K * error;
    dz = dynamics(z(:, k-1), u, r, n);
    z(:,k) = Ts*dz + z(:, k-1);
    
end
figure;
subplot(3,1,1);
plot(t, z(3, :), 'b-', t, z_desired(3)*ones(size(t)), 'r--');
title('Position (z)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position');

subplot(3,1,2);
plot(t, z(2, :), 'b-', t, z_desired(2)*ones(size(t)), 'r--');
title('Position (y)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position');
    
subplot(3,1,3);
plot(t, z(1, :), 'b-', t, z_desired(1)*ones(size(t)), 'r--');
title('Position (x)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position');