function U = fun(y, un, vt, A, a, b)
un = un';
w = zeros(length(b),length(un));
U(:,1) = un;
for i = 1:length(vt) - 1
    tau = vt(i + 1) - vt(i);
for k = 1:length(b)
    w(k,:) = y(un + tau*(w')*A(k,:)',vt(i) + tau*a(k));
end
un = un + tau*(w')*b';
U(:,i + 1) = un;
end
end