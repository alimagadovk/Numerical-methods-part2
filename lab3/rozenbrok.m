function u = rozenbrok(fun, u0, a, b, tau, A)
    l = length(u0);
    
    u = [u0];
    
    for t = a: tau : b - tau
        w = (eye(l) - A * tau * diff_f2(t,  u(:, end))) \ fun(t + tau/2, u(:, end));
        u = [u, u(:,end) + tau * real(w)];
    end
    
end