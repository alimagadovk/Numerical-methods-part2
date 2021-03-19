%% 1
a = 77617;
b = 33096;
f = b^2 * (21 + 55*b^2 - 10*a^2) - 2*a^2 + a / (2*b)
%% 2
a = [20 23 30];
for i = 1:3
figure(i)
m = a(i);
n = 2*m;
A = eye(n);
v = ones(n-1,1);
A = A + diag(v,-1);
A(1,n) = 10^(-n);
syms l;
matr = A - l*eye(n);
u = det(matr);
v = solve(u);
x = real(v);
y = imag(v);
plot(x,y,'r*')
grid on
axis([0.5 1.5 -0.5 0.5])
end
%% 2
hold on
a = [20 23 30];
for i = 1:3
figure(i)
m = a(i);
n = 2*m;
syms l;
u = (1 - l)^(n) - 10^(-n);
v = solve(u);
x = real(v);
y = imag(v);
plot(x,y,'b.')
grid on
axis([0.5 1.5 -0.5 0.5])
end
%% 4 1
close all
clear
clc
v = [16 32 64 128 256];
syms x
y = @(x)(4 ./ (1 + x.^2));
for i = 1:length(v)
h = 1/v(i);
x0 = 0;
I = 0;
while (x0 < 1)
f0 = y(x0);
f1 = y(x0 + h);
I = I + h*double(f0 + f1)/2;
x0 = x0 + h;
end
U(i) = I;
end
vpa(U,8)
for i = 1:length(v) - 2
    p(i) = log2((U(i + 2) - U(i + 1))/(U(i + 1) - U(i)));
end
vpa(p)
N = 1:length(v) - 2;
figure()
plot(N,p)
grid on
for i = 1:length(v) - 1
    U1(i) = U(i + 1) + (U(i + 1) - U(i))/3;
end
vpa(U1,8)
for i = 1:length(v) - 3
    p1(i) = log2((U1(i + 2) - U1(i + 1))/(U1(i + 1) - U1(i)));
end
vpa(p1)
N = 1:length(v) - 3;
figure()
plot(N,p1,'r')
grid on
%% 5
close all
clear
clc
v = [16 32 64 128 256];
syms x
y = @(x)(1 ./ (2.*sqrt(x)));
for i = 1:length(v)
h = 1/v(i);
x0 = 0;
I = 0;
while (x0 < 1)
f0 = y(x0 + h/2);
I = I + h*double(f0);
x0 = x0 + h;
end
U(i) = I;
end
vpa(U,8)
for i = 1:length(v) - 2
    p(i) = log2((U(i + 2) - U(i + 1))/(U(i + 1) - U(i)));
end
vpa(p)
N = 1:length(v) - 2;
figure()
plot(N,p)
grid on
for i = 1:length(v) - 2
    U1(i) = U(i + 2) + (U(i + 2) - U(i + 1))/((U(i + 1) - U(i))/(U(i + 2) - U(i + 1)) - 1);
end
vpa(U1,8)
p1 = log2((U1(3) - U1(2))/(U1(2) - U1(1)));
vpa(p1)
U2 = U1(3) + (U1(3) - U1(2))/((U1(2) - U1(1))/(U1(3) - U1(2)) - 1);
vpa(U2)
%%