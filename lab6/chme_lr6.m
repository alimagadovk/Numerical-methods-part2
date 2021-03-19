clc
clear
close all

k0 = 1;
k1 = 0.5;
n = 8;
a = 0;
b = 1;
raschet = 7;
eps = 10^-12;

[x,u,lambda] = MmNewton2(a, b, k0, k1, n, raschet, eps);

hold on
grid on
title('Решение')
plot(x,u(1:end-1))

figure
hold on
grid on
title('\lambda')
plot(1:length(lambda), lambda,'*r')
plot(1:length(lambda), lambda,'r')

% порядок
p = zeros(length(lambda)-2, 1);
for i = 1:length(lambda)-2
    p(i) = -log2(abs((lambda(i+2) - lambda(i+1))/(lambda(i+1) - lambda(i))));
end

% уточнение по Ричадрсону
lambda_pr = lambda(2:end); %промежуточное лямбда
for j = 1:floor(raschet-2)
    p = zeros(length(lambda_pr)-2, 1);
    for i = 1:length(lambda_pr)-2
        p(i) = -log2(abs((lambda_pr(i+2) - lambda_pr(i+1))/(lambda_pr(i+1) - lambda_pr(i))));
    end
    R = zeros(length(lambda_pr)-1, 1);
    for i = 1:length(R)
        R(i) = (lambda_pr(i+1) - lambda_pr(i)) / (2^round(p(end)) - 1);
    end
    lambda_pr = lambda_pr(2:end) + R;
end
lambda_res = (2^round(p(end))*lambda_pr(2) - lambda_pr(1)) / (2^round(p(end)) - 1)

% % уточнение по Эйткину
% lambda2 = lambda(2:end)
% for j = 1:floor(raschet/2)
%     R = zeros(length(lambda2)-2, 1);
%     for i = 1:length(R)
%         R(i) = (lambda2(i+2) - lambda2(i+1))  /... 
%                ((lambda2(i+1) - lambda2(i)) / (lambda2(i+2) - lambda2(i+1)) - 1);
%     end
%     lambda2 = lambda2(3:end) + R
% end

