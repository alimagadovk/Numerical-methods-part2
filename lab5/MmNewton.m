function u = MmNewton(f, u0, N, a, b, k0, k1, eps)
    x=-1:2/N:1;
    J=zeros(N+1);
    F=zeros(N+1,1);
    du=ones(1,N+1);
    u=u0;
    
    while(max(abs(du)) > eps )
        J(1) = 1;
        for i = 2:N
            J(i,i)=-(k0+k1*(u(i)^2+u(i+1)^2)/2) + (u(i+1)-u(i))*(k1*u(i)) - (k0+k1*(u(i)^2+u(i-1)^2)/2) - (u(i)-u(i-1))*(k1*u(i));
            J(i,i-1)=(k0+k1*(u(i)^2+u(i-1)^2)/2) - (u(i)-u(i-1))*(k1*u(i-1));
            J(i,i+1)=(k0+k1*(u(i)^2+u(i+1)^2)/2) + (u(i+1)-u(i))*(k1*u(i+1));
        end
        J(end)=1;
        F(1)=u(1);
    
        %разностная схема 
        
        a = (u(3:end)-u(2:end-1)).*(k0+k1*(u(2:end-1).^2 + u(3:end).^2)/2) - (u(2:end-1)-u(1:end-2)).*(k0+k1*(u(2:end-1).^2+u(1:end-2).^2)/2) - ((2/N)^2).*f(x(2:end-1));
%         l = length(a)
%         l2 = length(F(2:end-1))
%         len = length(u)
        F(2:end-1)= a(1:length(a));
        F(end) = u(end);
        F=-F;
        gaus=rref([J F]);
        du=gaus(:,end);
        u=u+du;             
    end
    u=u';
end