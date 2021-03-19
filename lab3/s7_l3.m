clear all
close all
clc
butcher = [0 0; 0.5 0];


a = [0 0.5];
b = [0 1];

tau_1 = 1/8;
u_1 = rungekutta(@f2, 0, 0.75, [1; 1], tau_1, butcher, a, b);
    
figure; hold on; grid on;
title('шаг по времени 1/8');
xlabel( 'Время, t' ); ylabel( 'u(t)' );
plot(0:tau_1:0.75, u_1)


tau_2 = 1/128;
u_2 = rungekutta(@f2, 0, 0.75, [1; 1], tau_2, butcher, a, b);
    
figure; hold on; grid on;
title('шаг по времени 1/128');
xlabel( 'Время, t' ); ylabel( 'u(t)' );
plot(0:tau_2:0.75, u_2)
axis equal
%%
A = [1/2 1 (1 + i)/2];
f = @(y,x)f2(x,y);
for j = 1:1
    u_j = rozenbrok2(f, [1;1], [0:1/8:0.75], A(j))
    figure; hold on; grid on;
    0:1/8:0.75
    u_j(1,:)
    plot(0:1/8:0.75, u_j(1,:));
end
axis equal

% clear all
% close all
% clc
% butcher = [0 0; 0.5 0];
% 
% 
% a = [0 0.5];
% b = [0 1];
% 
% tau_1 = 1/8;
% u_1 = rungekutta(@f2, 0, 0.75, [1; 1], tau_1, butcher, a, b);
%     
% figure; hold on; grid on;
% title('шаг по времени 1/8');
% xlabel( 'Время, t' ); ylabel( 'u(t)' );
% plot(0:tau_1:0.75, u_1, 'r')
% 
% 
% tau_2 = 1/128;
% u_2 = rungekutta(@f2, 0, 0.75, [1; 1], tau_2, butcher, a, b);
%     
% figure; hold on; grid on;
% title('шаг по времени 1/128');
% xlabel( 'Время, t' ); ylabel( 'u(t)' );
% plot(0:tau_2:0.75, u_2, 'r')
% axis equal
% 
% A = [1/2 1 (1 + i)/2];
% for i = A
%     u_i = rozenbrok(@f2, [1;1], 0, 0.75, 1/8, i);
%     figure; hold on; grid on;
%     plot(0:1/8:0.75, u_i);
% end
% axis equal

