%Setting up the plot
figure; hold on
title(sprintf('Trajectory\nTime: %0.2f sec', t(1)), 'Interpreter', 'Latex');
xlabel('x', 'Interpreter', 'Latex')
ylabel('y', 'Interpreter', 'Latex')
zlabel('z', 'Interpreter', 'Latex')
grid minor  % Adding grid lines
axis equal  % Equal axis aspect ratio
view(-37.5,30);  % Setting viewing angle



% Create file name variable
filename = 'animation3D_centro.gif';
%Plotting with no color to set axis limits
plot3(c(1,:),c(2,:),c(3,:),'Color','none');
% Plotting the first iteration
p = plot3(c(1,1),c(2,1),c(3,1),'.b');
m = scatter3(c(1,1),c(2,1),c(3,1),'filled','b');
% Iterating through the length of the time array
for k = 1:length(c)
    % Updating the line
    p.XData = c(1,1:k);
    p.YData = c(2,1:k);
    p.ZData = c(3,1:k);
    % Updating the point
    m.XData = c(1,k); 
    m.YData = c(2,k);
    m.ZData = c(3,k);
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