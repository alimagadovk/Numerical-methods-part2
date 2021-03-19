function u = rozenbrok2(fun, u0, t, A)
tau = t(2) - t(1);
    l = length(u0);
    
    u = u0;
  du = 10^(-5);
    for i = 1:length(t) - 1
pr(:,1) = (fun(u(:,i) + [du;0],t(i + 1) + tau/2) - fun(u(:,i) - [du;0],t(i + 1) + tau/2)) / (2 * du);
pr(:,2) = (fun(u(:,i) + [0;du],t(i + 1) + tau/2) - fun(u(:,i) - [0;du],t(i + 1) + tau/2)) / (2 * du);
        w = (eye(l) - A * tau * pr) \ fun(u(:,i),t(i + 1) + tau/2);
        u = [u, u(:,end) + tau * real(w)];
    end
end