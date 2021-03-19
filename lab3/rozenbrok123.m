function u = rozenbrok(fun, u0, tn, A)
tau = tn(2) - tn(1);
u = u0;
len = length(u0);
    for t = tn(1):tau:tn(end - 1)
        fp = fun(t + tau/2,u + 10^(-5)) - fun(t + tau/2,u + 10^(-5)) / (10^(-5))
        w = fun(t + tau/2, u(:, end)) / (eye(len) - A * tau * diff(fun(t + tau/2, u(:, end)), t));
        u = [u, u(:,end) + tau * real(w)];
    end
end