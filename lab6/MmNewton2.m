function [x,u,lambda] = MmNewton2(a, b, k0, k1, n, raschet, eps)

h = (b - a) / n;
lambda0 = 40;
u0 = zeros(1,n+2); %начальные условия уравнения
du = ones(1,n+2);
u0(end) = lambda0;
u0(end/2+1) = h;
u0(end/2-1) = -h;
x = a : h : b;
u = u0;

lambda = zeros(raschet + 1, 1);
lambda(1) = lambda0; 
m = zeros(raschet, 1);

for j = 1 : raschet
    while(max(abs(du)) > eps)
        dF = zeros(n+2);
        
        dFdown = (k0 + k1*(u(2:end-2).^2 + u(1:end-3).^2)/2) - (u(2:end-2) - u(1:end-3)).*(k1*u(1:end-3));
        dFmain = -(k0 + k1*(u(2:end-2).^2 + u(3:end-1).^2)/2) + (u(3:end-1) - u(2:end-2)).*(k1*u(2:end-2))...
                 -(k0 + k1*(u(2:end-2).^2 + u(1:end-3).^2)/2) - (u(2:end-2) - u(1:end-3)).*(k1*u(2:end-2))...
                 + h^2*u(end);
        dFup = (k0 + k1*(u(2:end-2).^2 + u(3:end-1).^2)/2) + (u(3:end-1) - u(2:end-2)).*(k1*u(3:end-1));
               
        dF = dF + diag([dFdown 0 0], -1) + diag([1 dFmain 1 0], 0) + diag([0 dFup 0], 1); 
        dF(2:end-2, end) = h^2*u(2:end-2); %граничные условия для якобиана
        dF(end, end/2-1) = -1;
        dF(end, end/2+1) = 1;

        F = zeros(n+2, 1); %левая часть ур-ия
        F(1) = u(1);
        F(2:end-2) = (u(3:end-1) - u(2:end-2)).*(k0 + k1*(u(3:end-1).^2 + u(2:end-2).^2)/2)...
                     -(u(2:end-2) - u(1:end-3)).*(k0 + k1*(u(1:end-3).^2 + u(2:end-2).^2)/2)...
                     + h^2*u(2:end-2)*u(end);
        F(end-1) = u(end-1); %из граничных условий
        F(end) = u(end/2+1)-u(end/2-1)-2*h; %дополнительное условие
        F = -F;

        gaus = rref([dF F]); %метод Гаусса
        du = gaus(:, end); %последний столбец матрицы G это интересующее нас приращение
        u = u + du';
    end
    lambda(j+1) = u(end);
    u0 = u;
    n = 2*n;
    h = (b - a) / n;
    x = a : h : b;
    u = zeros(1,n+2);
    du = ones(1,n+2);
    u(1:2:end-1) = u0(1:end-1);
    u(end) = u0(end);
    u(2:2:end-2) = (u0(1:end-2) + u0(2:end-1))/2;
end
end