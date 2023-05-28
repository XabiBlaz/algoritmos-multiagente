% Setting up the Plot
figure; hold on
title(sprintf('Trajectory\nTime: %0.2f sec', t(1)), 'Interpreter', 'Latex');
xlabel('x', 'Interpreter', 'Latex')
ylabel('y', 'Interpreter', 'Latex')
grid minor  % Adding grid lines
axis equal  % Equal axis aspect ratio



% Create file name variable
filename = 'animationGA2D.gif';
%Plotting with no color to set axis limits
plot(c(1,:),c(2,:),'Color','none');
% Plotting the first iteration
p = plot(c(1,1),c(2,1),'.b');
axis([-2 6 -2 4.5])
m = scatter(c(1,1),c(2,1),'filled','b');
% Iterating through the length of the time array
for k = 1:length(c)
    % Updating the line
    p.XData = c(1,1:k);
    p.YData = c(2,1:k);
    % Updating the point
    m.XData = c(1,k); 
    m.YData = c(2,k);
    % Updating the title
    title(sprintf('Trajectory\nTime: %0.2f sec', t(k)),'Interpreter','Latex');
    % Delay
    pause(0.01)
    % Saving the figure
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1);
    end
end