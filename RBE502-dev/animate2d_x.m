function animate2d_x(t, s, video_name)
figure('units','normalized','outerposition',[0 0 1 1])
time_period = numel(t);
myVideo = VideoWriter(video_name); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)
h = plot(NaN,NaN); %// initiallize plot. Get a handle to graphic object
axis([0 t(end) 0 5]);  
xlabel('Time (s)');
ylabel('Difference in positions');
x_position = [];
for i = 1:time_period

    x_position = vertcat(x_position, s(i,1))
    
end
%%disp(size(norm_vector));
for i = 1:time_period
    pause(0.01)
    set(h, 'XData', t(1:i), 'YData', x_position(i)); 
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
end
close(myVideo);
end