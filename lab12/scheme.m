function [U] = scheme(sigma,a,step,T,tau,f,c,u_0_t,u_alpha_t,u_x_0,ut_x_0)
gridX = 0:step:a; 
gridTime = 0:tau:T;
xNum = size(gridX,2);
timeNum = size(gridTime,2);

U = zeros(timeNum,xNum);
U(1,:) = u_x_0(gridX);
U(:,1) = u_0_t;
U(:,end) = u_alpha_t;

Bx = [((c/step)^2)*ones(xNum, 1) -2*((c/step)^2)*ones(xNum, 1) ((c/step)^2)*ones(xNum, 1)];
Lx = spdiags(Bx, -1:1, xNum, xNum);
Lx = (tau^2)*Lx;
Lx(1,:) = 0;
Lx(end,:) = 0;
E = eye(xNum);
u2Layer = u_x_0(gridX) + tau*ut_x_0 + (1/2)*((Lx*(u_x_0(gridX))')' + tau^2*f(gridX,0));
U(2,2:(end-1)) =  u2Layer(2:(end - 1));
matrix = (E - sigma*Lx)\Lx;
for i = 2:1:(timeNum - 1)
    uNewLayer = (matrix*(U(i,:))')' + 2*U(i,:) - U(i - 1,:);
    U(i + 1,2:(end - 1)) = uNewLayer(1,2:(end - 1));
end
    
end