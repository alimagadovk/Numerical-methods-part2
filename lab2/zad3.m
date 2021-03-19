%% 
clc
close all
t = [0, 1];
a = [0 1/2 1/2 1]';
b = [1/6 1/3 1/3 1/6];
butch = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0];

for i = 1:7
    u_n = 0.5;
    n = 2^(i-1);
    h = 1/n;
    t = 0:h:1;
    for k = 1:n
        t_n = [t(k) t(k+1)];
        u_n = kyt(t_n, u_n, a, b, butch, 0, 4);
    end
    disp(['Количество интервалов = ', num2str(n)])
    u_n
    u_mas(i) = u_n;
end

figure
title('Пункт а');
p_123 = log2( (u_mas(3)-u_mas(2))/(u_mas(2)-u_mas(1)) );
p_234 = log2( (u_mas(4)-u_mas(3))/(u_mas(3)-u_mas(2)) );
p_345 = log2( (u_mas(5)-u_mas(4))/(u_mas(4)-u_mas(3)) );
p_456 = log2( (u_mas(6)-u_mas(5))/(u_mas(5)-u_mas(4)) );
p_567 = log2( (u_mas(7)-u_mas(6))/(u_mas(6)-u_mas(5)) );
hold on
xlabel('номер тройки')
ylabel('эффективный порядок')
grid on
p = [p_123 p_234 p_345 p_456 p_567];
pi = [1 2 3 4 5];
plot(pi, p);

%%

t = [0, 1];
u_j = [1; -0.5; 0.6];
a = [0 1/2 1/2 1]';
b = [1/6 1/3 1/3 1/6];
butch = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0];

figure
title('Пункт б');
for i = 1:7
    u_n = u_j;
    n = 2^(i-1);
    h = 1/n;
    t = 0:h:1;
    for k = 1:n
        t_n = [t(k) t(k+1)];
        u_n = kyt(t_n, u_n, a, b, butch, 1, 4);
    end
    disp(['Количество интервалов = ', num2str(n)])
    u_n
    u_mas(1:3,i) = u_n;
end

for c = 1:3
    p_123 = log2( (u_mas(c,3)-u_mas(c,2))/(u_mas(c,2)-u_mas(c,1)) );
    p_234 = log2( (u_mas(c,4)-u_mas(c,3))/(u_mas(c,3)-u_mas(c,2)) );
    p_345 = log2( (u_mas(c,5)-u_mas(c,4))/(u_mas(c,4)-u_mas(c,3)) );
    p_456 = log2( (u_mas(c,6)-u_mas(c,5))/(u_mas(c,5)-u_mas(c,4)) );
    p_567 = log2( (u_mas(c,7)-u_mas(c,6))/(u_mas(c,6)-u_mas(c,5)) );
    hold on
    xlabel('номер тройки')
    ylabel('эффективный порядок')
    grid on
    p = [p_123 p_234 p_345 p_456 p_567];
    pi = [1 2 3 4 5];
    plot(pi, p);
end

figure
title('Пункт б');
hold on
grid on
xlabel('Количество интервалов')
ylabel('u(1)')
x = [1 2 4 8 16 32 64];
y = u_mas
plot(x, y(1,:), 'r')
plot(x, y(2,:), 'g')
plot(x, y(3,:), 'm')