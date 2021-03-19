function f = ff(t, u)
om = [sin(t) cos(t) sin(t+pi/4)];
Omega = [0 -om(3) om(2); om(3) 0 -om(1); -om(2) om(1) 0];
f = Omega*u;
