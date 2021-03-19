function root = findangle(angle,systema)
    global v0;
    ang = angle * pi / 3000;
    gamma0 = tan(ang);
    u0 = v0 * cos(ang);
    
    [~, Y] = ode45(@(t,Y) systema(t, Y(1), Y(2), Y(3), Y(4)), [0 100], [0,0, gamma0, u0]);
    x = Y(:,1);
    y = Y(:,2);

    for i = numel(y)-1:-1:1
            if (y(i) == 0)
                root = x(i);
                return;
            end

            if (y(i) * y(i+1) <= 0)
                k1 = abs(y(i) / (y(i) - y(i+1)));
                k2 = abs(y(i+1) / (y(i) - y(i+1)));
                root = k2*x(i) + k1*x(i+1);
                return;
            end
    end
end