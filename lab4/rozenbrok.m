function u = rosenbrok(f, u0, T, a, G)
    n = size(u0, 1);
 
    u(:, 1) = u0;
%     u(:, 1) = u0(0);
  
    %fu = zeros(n, 1);
    du = 1e-5;
    for j = 1:length(T)-1
        for i = 1:n            
            S = zeros(size(u0));
            S(i) = du;
            fu(:, i) = (f(u(:, j) + S, T(j)) - f(u(:, j) - S, T(j)))/(2*du);
        end
        tau = T(j+1)-T(j);
        w = (G -a*tau*fu) \ f(u(:,j), T(j)+tau/2);
        u(:, j+1) = u(:, j) + tau * real(w);
    end    
end
