function [] =  plotAnimation(gridX,gridY,gridTime,U,timeStep)
[X, Y] = meshgrid(gridX, gridY);
for i = 1:1:size(gridTime,2)
	mesh(Y, X, U(:,:,i));
	axis([0 gridY(1,end) 0 gridX(1,end) -0.05 0.05]);
    grid on
    pause(timeStep);
    if(i ~= size(gridTime,2))
        cla;
    end
end
end