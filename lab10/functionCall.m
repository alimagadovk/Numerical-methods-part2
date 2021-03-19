clear
clc
close all

a = 6*pi;
b = 4*pi;
T = 10;
stepX = pi/30;
stepY = pi/30;
tau = 0.1;
k = 0.2;

gridX = 0:stepX:a;
gridY = 0:stepY:b;
gridTime = 0:tau:T;

%Начальное условие
u_x_y = mu(gridX,gridY);
%Граничные условия для Y
u_x_0 = mu(gridX,0);
u_x_b = mu(gridX,b);
%Граничные yсловия для X
u_y_0 = mu(0,gridY);
u_y_a = mu(a,gridY);
[ U ] = evolutWell(k,stepX,a,stepY,b,T,tau,u_x_y,u_x_0,u_x_b,u_y_0,u_y_a);

timeStep = 1e-1,5;
plotAnimation(gridX,gridY,gridTime,U,timeStep);