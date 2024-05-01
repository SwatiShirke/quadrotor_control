function [] = plot_trajectories(s,t1,z,t2)
x_uav = s(:,1);
y_uav = s(:,2);
z_uav = s(:,3);
x_bug = s(:,13);
y_bug = s(:,14);
z_bug = s(:,15);
figure;
plot3(x_uav,y_uav,z_uav,'b', 'LineWidth',2);
hold on;
plot3(x_bug,y_bug,z_bug,'r','LineWidth',2);
xlabel('x position');
ylabel('y position');
zlabel('z position');
legend("Quadrotor's trajectory","Bug's trajectory","Bug and quadrotor's trajectory")
grid on;
%% print rerutn path
hold on;
plot3(z(:,1),z(:,2),z(:,3),'g','LineWidth',2);
xlabel('x position');
ylabel('y position');
zlabel('z position');
legend("Quadrotor's trajectory","Bug's trajectory","Bug and quadrotor's trajectory")
grid on;
axis([-5 5 -5 5 -5 5])



%%%% for plotting simulation
% figure;
% axis([-5 5 -5 5 -5 5]);  % Adjust axis limits based on your data
% xlabel('X-axis');
% ylabel('Y-axis');
% zlabel('Z-axis');
% title('Plots');
% 
% for i=11:length(t)
%     plot3(x_uav(10:i), y_uav(10:i), z_uav(10:i), 'b')
%     plot3(x_bug(10:i), y_bug(10:i), z_bug(10:i), 'r')
%     hold on;
%     plot3(x_uav(i), y_uav(i), z_uav(i), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'Color', 'b');
%     plot3(x_bug(i), y_bug(i), z_bug(i), '-', 'MarkerSize', 2, 'MarkerFaceColor', 'r', 'Color', 'r');
% %     scatter3(x(i), y(i), z(i))
%     axis([-2 2 -2 2 0 70]);
%     pause(0.1);
%     drawnow;
% end
% close all;

%myfig = figure('units','normalized','outerposition',[0 0 1 1])
% figure('units','normalized','outerposition',[0 0 1 1])
% axis([-5 5 -5 5 -5 5]);  
% myVideo = VideoWriter('myVideoFile'); %open video file
% myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
% open(myVideo)
% %replace t with length of t
% for i=11:length(t1)
%     plot3(s(10:i,1), s(10:i,2), s(10:i,3), 'r');
%     hold on;
%     plot3(s(10:i,13), s(10:i,14), s(10:i,15), 'b');
%     hold on;
%     legend('UAV', 'Bug');
%     plot3(s(i,1), s(i,2), s(i,3), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'r', 'Color', 'r', 'HandleVisibility', 'Off');
%     hold on;    
%     plot3(s(i,13), s(i,14), s(i,15), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'b', 'Color', 'b', 'HandleVisibility','off');
%     axis([-5 5 -5 5 -5 5]);
%     grid on;
%     legend('-DynamicLegend');
%     pause(0.1);
%     frame = getframe(gcf); %get frame
%     writeVideo(myVideo, frame);
% 
% 
% end
% hold all;
% 
% for i=11:length(t2)
%     plot3(z(10:i,1), z(10:i,2), z(10:i,3), 'r', 'HandleVisibility','off');
%     legend('Returning UAV');
%     hold on;
%     plot3(z(i,1), z(i,2), z(i,3), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'r', 'Color', 'r', 'HandleVisibility','off');
%     axis([-5 5 -5 5 -5 5]);
%     grid on;
%     legend('-DynamicLegend');
%     pause(0.1);
%     frame = getframe(gcf); %get frame
%     writeVideo(myVideo, frame);
%     %clf(myfig);
% 
% end
% close(myVideo);
% close all;