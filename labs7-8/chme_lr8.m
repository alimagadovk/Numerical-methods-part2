clc
clear all
close all

h = 1;
tau = 0.05;

x = 0 : h : 100;
t = 0 : tau : 50;

u = zeros(size(t, 2), size(x, 2));
u(:, 1) = zeros(length(t), 1);
u(1, :) = 1./(1 + ((x - 50)/10).^4);
k = h/tau;

for i = 2 : size(u, 1)
    for j = 2 : size(u, 2)
        u(i, j) =sqrt(k^2 + 2 * k * u(i-1, j) + u(i, j-1)^2) - k; 
    end
end

for i = 1 : length(t)
    clf
    hold on
    grid on
    plot(x, u(i, :),'r') 
    pause(1e-6)
end