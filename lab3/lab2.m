close all
clear
clc
A = [0 0; 0.5 0];
a = [0 0.5]';
b = [0 1];
v = [8 128];
for j = 1:2
tau = 1/v(j);
t = 0:tau:0.75;
f = @(y,x)f2(x,y);
u0 = [1 1];
U = fun(f, u0, t, A, a, b);
figure(j)
hold on
grid on
plot(t,U)
end
%%
clear
clc
u = [1;1];
f = @(x,y)f2(y,x);
A = [1/2 1 (1 + i)/2];
t = 0:1/8:0.75;
figure
    hold on
    grid on
for j = 1:3
    u_i = rozenbrok2(f, [1;1], t, A(j));
    
    plot(t, u_i, 'r-.');
end
t = 0:1/128:0.75;
for j = 1:3
    u_i = rozenbrok2(f, [1;1], t, A(j));

    plot(t, u_i, '-.');
end