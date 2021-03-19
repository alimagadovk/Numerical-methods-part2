clear all; close all; 

g = 9.80665;     % (�/c^2) 
d = 12.7e-3;     % (�) 
m = 48.3e-3;     % (��) 
i = 1.0629;      % ����������� �����
v15 = 820;       % (�/�) ��������� �������� ������� ��� 15 ����. C
P0 = 750;        % (��.��.�.) 
T0 = 15;         % (���� �)
w = 0.5;         % ��������� � ����� 1
zt = 1.35e-3;    % ����������� ����������� ������
cd = 0.0423;
m3 = 0.1744;
T1 = 15; T2 = 5;
L=2000;          % (�) ���������
eps = 0.01;      % �������� �����

S = pi*d^2/4; 

T=T1;
global v0;
v0 = v15*(1+zt*(T-15)); 
Tv = (T0+273.15) / (1 - 3/8 * 12.7/P0 *w);

Ty = @(y)Tv - 0.0065*y;
ro = @(y)1.225 * (Ty(y)/Tv)^4.256 * P0/Tv * 288.15/760;
a = @(y)340.294 * (Ty(y)/288.15)^0.5;
F = @(v,y)i*S*(ro(y)*v^2/2)*cx(v/a(y));

% ������� 1
% systema = @(x, y, gamma, u) [
%     gamma
%     -g / u^2
%     -F(u*sqrt(1+gamma^2),y)/(m*u*sqrt(1+gamma^2))
%    ];
% 
%     range = [0 100];
% while (range(2) - range(1) > eps/2)
%     mid = (range(2) + range(1)) / 2;
%     angle = mid * pi/3000; % ���� �������� � ��������
%     gamma0 = tan(angle);  
%     u0 = v0 * cos(angle);
% 
%     [x,Y] = ode45(@(x,Y) systema(x,Y(1),Y(2),Y(3)), [0 2000], [0, gamma0, u0]);
%     y = Y(:,1);
%     L = y(end);
% 
%     if (L > 0)
%         range(2) = mid;
%     else
%         range(1) = mid;
%     end 
% end
%     final = (range(2) + range(1))/2;
%     fprintf('T = %d. ���� ��������: %.2f \n', T, final);

% ������� 3
% systema = @(t, x, y, gamma, u) [
%     u
%     gamma*u
%     -g / u
%     -F(u*sqrt(1+gamma^2),y)/(m*sqrt(1+gamma^2))
%     ];
% 
% funang = @(angle) -findangle(angle,systema);
% [ang, dist] = fminsearch(funang, 300);
% fprintf('���� ��������� %.2f ��� ���� %.2f \n', abs(dist), ang)

% ������� 2
vW = 10; 

sys = @(t, x, y, gamma, u, z, q) [
    u
    gamma * u
    - g / u
    -F(u*sqrt(1+gamma^2),y)/(m*sqrt(1+gamma^2))
    q * u * pi * v0 * cd
    exp(-m3 * t) / u^2 / (1 + gamma^2) 
    ];

angle = 33.40 * pi / 3000;
gamma0 = tan(angle);
u0 = v0 * cos(angle);
timeMax = 4.2648;

[t, Y] = ode45(@(t,Y) sys(t, Y(1), Y(2), Y(3), Y(4), Y(5), Y(6)), [0 timeMax], [0,0, gamma0, u0, 0, 0]);
x = Y(:,1);
y = Y(:,2);
z = Y(:,5);

% ���������� ��-�� ���������
derDeviat = z(end);
% ���������� ��-�� �����
windDeviat = vW * t(end)- vW / v15 * 2000;
% ����������
deviat = windDeviat - derDeviat;
fprintf('���������� %.2f \n', deviat)
% ��������
corr = (atan(deviat / 2000))*3000/pi;
fprintf('�������� %.2f \n', corr)