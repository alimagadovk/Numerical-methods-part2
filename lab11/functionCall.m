clear
clc
close all

a = 6*pi;
b = 4*pi;
stepX = pi/30;
stepY = pi/30;
k = 0.2;

eps = 10^(-12);

gridX = 0:stepX:a;
gridY = 0:stepY:b;

S = round((1/4)*log(1/eps)*log(2*(size(gridX,2))/pi));
lymbdaMin = (min(((pi/a)^2)*k,((pi/b)^2)*k))/3;
lymbdaMax = 3*(max(4*k/(stepX^2),4*k/(stepY^2)));
tauMin = 2/lymbdaMax;
tauMax = 2/lymbdaMin;
gridTime = zeros(1,S + 1);
tau = zeros(1,S);
for s = 1:1:S 
    tau(1,s) = tauMin*((tauMax/tauMin)^((s - 1)/(S - 1)));
    gridTime(1,s + 1) = gridTime(1,s) + tau(1,s);
end
%Начальное условие
u_x_y = mu(gridX,gridY);

[U residual] = evolutWell(k,stepX,a,stepY,b,gridTime,tau,u_x_y);

[X, Y] = meshgrid(gridX, gridY);
mesh(X, Y, U(:,:,end));
grid on

figure()
plot(1:S,residual)
hold on
grid on
xlabel('Номер итерации')
ylabel('Невязка')