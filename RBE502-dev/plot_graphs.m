function [] = plot_graphs(s,t, A,B,K)
z = s(:,1:12);
z_desired = s(:,13:15);
error = sqrt((z(:,1)- z_desired(:,1)).^2 + (z(:,2)- z_desired(:,2)).^2 + (z(:,3)- z_desired(:,3)).^2);
figure;
subplot(2,2,1);
plot(t, error, 'b-',t, zeros(size(error)))
title('Error');
xlabel('Time (s)');
ylabel('Error');
legend('Error', 'Location','northwest');

subplot(2,2,2);
plot(t, z(:, 3), 'b-', t, z_desired(:,3), 'r--');
title('Position (z)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position','Location','northwest');

subplot(2,2,3);
plot(t, z(:, 2), 'b-', t, z_desired(:,2), 'r--');
title('Position (y)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position','Location','northwest');
    
subplot(2,2,4);
plot(t, z(:, 1), 'b-', t, z_desired(:,1), 'r--');
title('Position (x)');
xlabel('Time (s)');
ylabel('Position');
legend('Actual Position', 'Desired Position','Location','northwest');

figure;
%%closed loop anaylsis 
X_mat = A - B*K;
eigen_value = eig(X_mat);
real_value = real(eigen_value);
imag_value = imag(eigen_value);

scatter(real_value, imag_value, "x")
%axis([-8 8 -8 8])
xlabel('\sigma');
ylabel('j\omega');
box on;



