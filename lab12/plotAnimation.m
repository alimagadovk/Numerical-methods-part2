function [] =  plotAnimation(U,gridSpace,gridTime,timeStep)
for i = 1:1:size(gridTime,2)
    hold on
    axis([0 gridSpace(end) -2 2])
    plot(gridSpace,U(i,:),'b');
    grid on
    pause(timeStep);
    if(i ~= size(gridTime,2))
        cla;
    end
    title(['t = ' num2str(gridTime(i))]);
    xlabel('x'); ylabel('u(x,t)');  
end
end