function [U residual] = evolutWell(k,stepX,a,stepY,b,gridTime,tau,u_x_y)
gridX = 0:stepX:a;
gridY = 0:stepY:b;

xNum = size(gridX,2);
yNum = size(gridY,2);
timeNum = size(gridTime,2);

U = zeros(yNum,xNum,timeNum);
U(:,:,1) = u_x_y;
U(:,1,:) = repmat(u_x_y(:,1),1,timeNum);
U(1,:,:) = repmat(u_x_y(1,:)',1,timeNum);
U(yNum,:,:) = repmat(u_x_y(yNum,:)',1,timeNum);
U(:,xNum,:) = repmat(u_x_y(:,xNum),1,timeNum);

Bx = [k/stepX^2*ones(xNum, 1) -2*k/stepX^2*ones(xNum, 1) k/stepX^2*ones(xNum, 1)];
Lx = spdiags(Bx, -1:1, xNum, xNum);
Lx(:,1) = 0;
Lx(:,end) = 0;

By = [k/stepY^2*ones(yNum, 1) -2*k/stepY^2*ones(yNum, 1) k/stepY^2*ones(yNum, 1)];
Ly = spdiags(By, -1:1, yNum, yNum);
Ly(1,:) = 0;
Ly(end,:) = 0;

bounX = zeros(1, xNum);
bounY = zeros(yNum, 1);
residual = zeros(1,timeNum - 1);
for i = 2:timeNum
    F = [bounX; U(2:end-1,:,i-1)*Lx; bounX] + [bounY, Ly*U(:,2:end-1,i-1), bounY];
	v = F/ (eye(xNum) - ((tau(1,i-1))/2)*Lx);
	du = (eye(yNum) - ((tau(1,i-1))/2)*Ly) \ v;
    U(2:end-1, 2:end-1,i) = U(2:end-1, 2:end-1,i-1) + (tau(1,i-1))*du(2:end-1, 2:end-1);
    residual(1,i-1) = max(max(abs(F)));
end
end