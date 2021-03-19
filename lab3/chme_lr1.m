% задание 1
% a=77617; b=33096;
% f1=21*b*b-2*a*a+55*b^4-10*a^2*b^2+a/(2*b)
% f2=b^2*(21+55*b*b-10*a*a)-2*a*a+a/(2*b)
% почему разные значения?

% задание 2
% аналитически есть
% m=20;
% for i=1:1:2*m
%     for j=1:1:2*m
%         if (i==j || j==i+1) 
%             A(i,j)=1; 
%         else
%             A(i,j)=0;
%         end
%     end
% end
% A(1,2*m)=10^(-2*m);
% A;
% [x1,x2]=eig(A)

% задание 3
% посчитать руками

% задание 4
% Int=[0, 0, 0, 0, 0];
% syms x;
% f=4/(1+x*x);
% L=[16, 32, 64, 128, 256];
% for i=1:1:5
%     for N=0:1/L(i):1-1/L(i)
%     Int(i)=Int(i)+(subs(f,N+1/L(i))-subs(f,N))*(N-1/L(i))/2;
%     end
% end
% Int
% y=diff(Int);
% y=-log10(abs(y));
% xx=[log10(L(1)), log10(L(2)), log10(L(3)), log10(L(4))];
% plot(-xx,y); grid on; hold on;
% p=log2(((Int(3)-Int(2))/(Int(2)-Int(1))))
% r=2;
% for i=1:1:4
%     U2(i)=(r^(-p)*Int(i+1)-Int(i))/(r^(-p)-1);
% end
% U2
% y2=diff(U2);
% y2=-log10(abs(y2));
% xx2=[log10(L(1)), log10(L(2)), log10(L(3))];
% plot(-xx2,y2); grid on;
% p2=log2(((U2(3)-U2(2))/(U2(2)-U2(1))));

% задание 5
% Int=[0, 0, 0, 0, 0];
% syms x;
% f=1/(2*x^(1/2));
% L=[16, 32, 64, 128, 256];
% for i=1:1:5
%     for N=0:1/L(i):1-1/L(i)
%     Int(i)=Int(i)+(1/L(i))*(subs(f,N+1/(2*L(i))));
%     end
% end
% Int
% y=diff(Int);
% y=-log10(abs(y));
% xx=[log10(L(1)), log10(L(2)), log10(L(3)), log10(L(4))];
% plot(-xx,y); grid on; hold on;
% p=log2(((Int(3)-Int(2))/(Int(2)-Int(1))))
% 
% for i=1:1:3
%     U2(i)=Int(i+2)+(Int(i+2)-Int(i+1))/((Int(i+1)-Int(i))/(Int(i+2)-Int(i+1))-1);
% end
% U2
% 
% U3=U2(3)+(U2(3)-U2(2))/((U2(2)-U2(1))/(U2(3)-U2(2))-1);
% U3


