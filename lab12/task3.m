clear
clc
close all

a = 6*pi;
T = 1;

f = @(x,t)(0);
c = 3;

u_0_t = 0;
u_alpha_t = 0;
u_x_0 = @(x)(sin(x.*(1 + 0.1*exp(-((x - 10).^2)))));
ut_x_0 = 0;

sigma = 1/3;
numLayers = 7;
err = zeros(1,numLayers);
for i = 0:1:(numLayers - 1)
    step = (6*pi/16)/(2^i);
    tau = (1/16)/(2^i);
    [U] = scheme(sigma,a,step,T,tau,f,c,u_0_t,u_alpha_t,u_x_0,ut_x_0);
    if(i ~= 0)
        err(i) = max(abs(U(end,1:2:end) - U_old(end,:)));
    end
    U_old = U;
end
p = zeros(1,numLayers - 2);
for i = 1:1:(numLayers - 2)
    p(i) = -log2((err(i + 1))/(err(i)));
end
figure()
plot(1:(numLayers - 2),p)
grid on