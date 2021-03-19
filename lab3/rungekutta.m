function [U] = rungekutta(f, t0, tn, u0, tau_h, A, a, b)
    u = [u0];    
    s = length(a);
    l = length(u0);
    w = zeros(l, s);
 
    for i = t0:tau_h:tn-tau_h
        for k = 1:s
            u_new = [];
            for j = 1:l
                u_new = [u_new; tau_h * dot(A(k,:), w(j,:))];
            end
            w(:,k) = f(i + tau_h * a(k), u(:,end) + u_new);  
        end

        u_new = [];
        for j = 1:l
            u_new = [u_new; tau_h * dot(b, w(j,:))];
        end
        u = [u, u(:,end) + u_new];
        w = zeros(l, s);    
    end
    U = u;
end