function [ U ] = evolutWell(k, stepX, a, stepY, b, T, tau, u_x_y, u_x_0, u_x_b, u_y_0, u_y_a)
    gridX = 0:stepX:a;
    gridY = 0:stepY:b;
    gridTime = 0:tau:T;

    xNum = length(gridX);
    yNum = length(gridY);
    timeNum = length(gridTime);

    U = zeros(yNum,xNum,timeNum);
    U(:,:,1) = u_x_y;
    U(:,1,:) = repmat(u_y_0,1,timeNum);
    U(1,:,:) = repmat(u_x_0',1,timeNum);
    U(yNum,:,:) = repmat(u_x_b',1,timeNum);
    U(:,xNum,:) = repmat(u_y_a,1,timeNum);

    Lx = zeros(xNum);
    for n = 2:xNum-1
        Lx(n-1,n) = 1;
        Lx(n,n) = -2;
        Lx(n+1,n) = 1;
    end
    Lx = k/stepX^2 * Lx;

    Ly = zeros(yNum);
    for n = 2:yNum-1
        Ly(n,n-1) = 1;
        Ly(n,n) = -2;
        Ly(n,n+1) = 1;
    end
    Ly = k/stepY^2 * Ly; 

%   F = U(:,:,1)*Lx + Ly*U(:,:,1); 
% 	v = F/ (eye(xNum) - (tau/2)*Lx);
    
for i = 2:timeNum
    F = U(:,:,i-1)*Lx + Ly*U(:,:,i-1);
	v = F/ (eye(xNum) - (tau/2)*Lx);
    Py = eye(yNum) - (tau/2)*Ly;
	du = Py \ v;
    U(2:end-1, 2:end-1,i) = U(2:end-1, 2:end-1,i-1) + tau*du(2:end-1, 2:end-1);
end
end