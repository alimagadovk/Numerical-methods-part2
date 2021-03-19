clear
clc
close all

a = 6*pi;
step = 6*pi/100;
T = 10;
tau = 0.01;

f = @(x,t)(0);
c = 3;

u_0_t = 0;
u_alpha_t = 0;
u_x_0 = @(x)(sin(x.*(1 + 0.1*exp(-((x - 10).^2)))));
ut_x_0 = 0;

sigma = 1/3;

[U] = scheme(sigma,a,step,T,tau,f,c,u_0_t,u_alpha_t,u_x_0,ut_x_0);
timeStep = 1e-3;
gridSpace = 0:step:a;
gridTime = 0:tau:T;
plotAnimation(U,gridSpace,gridTime,timeStep);