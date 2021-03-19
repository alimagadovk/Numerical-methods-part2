function u = kyt(t, u_n, a, b, butch, fun, s)
tau = t(2) - t(1);
w = zeros(s, length(u_n)); 
for k = 1:1:s
    x = t(1)+tau*a(k);
    y = u_n+tau*(w')*(butch(k,:)');
    
    if (fun == 0)
        w(k,:) = myfun(x, y);
    end
    if (fun == 1)
        w(k,:) = ff(x,y);
    end
end

u = u_n + tau*(w')*(b');
