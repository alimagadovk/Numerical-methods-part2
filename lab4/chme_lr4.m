clear
global r0 r1 r2 r3 r4 r5 ub;
r0 = 1000; r1 = 9000; r2 = r1; r3 = r1; r4 = r1; r5 = r1;
c1 = 1e-6; c2 = 2e-6; c3 = 3e-6; ub = 6;
u0 = [0; ub*r1/(r1+r2); ub*r1/(r1+r2); ub; 0];
G=[-c1 c1 0 0 0;c1 -c1 0 0 0;0 0 -c2 0 0;0 0 0 -c3 c3;0 0 0 c3 -c3];

%% 1
% A=1/2;
% h=1/5000;
% T=0:h:0.3;
% u=rozenbrok(@F, u0, T, A, G);
% figure
% grid on; hold on;
% plot(T, u(1,:)); 
% plot(T, u(2,:), 'r'); 
% plot(T, u(3,:), 'black'); 
% plot(T, u(4,:), 'g'); 
% plot(T, u(5,:), 'm'); 
% 
% A=(1+i)/2;
% u=rozenbrok(@F, u0, T, A, G)
% figure
% grid on; hold on;
% plot(T, u(1,:)); 
% plot(T, u(2,:), 'r'); 
% plot(T, u(3,:), 'black'); 
% plot(T, u(4,:), 'g'); 
% plot(T, u(5,:), 'm'); 

%% 2
A=[1/2 (1+i)/2];
% for i=1:1:2
    T=0:1/5000:0.1;
    u1=rozenbrok(@F, u0, T, A(1), G);
%     T=0:1/10000:0.1;
%     u2=rozenbrok(@F, u0, T, A(i), G);
%     T=0:1/20000:0.1;
%     u3=rozenbrok(@F, u0, T, A(i), G);
%     T=0:1/40000:0.1;
%     u4=rozenbrok(@F, u0, T, A(i), G);
%     T=0:1/80000:0.1;
%     u5=rozenbrok(@F, u0, T, A(i), G);
%     T=0:1/160000:0.1;
%     u6=rozenbrok(@F, u0, T, A(i), G);
%     T=0:1/320000:0.1;
%     u7=rozenbrok(@F, u0, T, A(i), G);
% 
%     P(i,1,1)=log2(abs((u3(1,end)-u2(1,end))/(u2(1,end)-u1(1,end))));
%     P(i,1,2)=log2(abs((u4(1,end)-u3(1,end))/(u3(1,end)-u2(1,end))));
%     P(i,1,3)=log2(abs((u5(1,end)-u4(1,end))/(u4(1,end)-u3(1,end))));
%     P(i,1,4)=log2(abs((u6(1,end)-u5(1,end))/(u5(1,end)-u4(1,end))));
%     P(i,1,5)=log2(abs((u7(1,end)-u6(1,end))/(u6(1,end)-u5(1,end))));
%     
%     P(i,2,1)=log2(abs((u3(2,end)-u2(2,end))/(u2(2,end)-u1(2,end))));
%     P(i,2,2)=log2(abs((u4(2,end)-u3(2,end))/(u3(2,end)-u2(2,end))));
%     P(i,2,3)=log2(abs((u5(2,end)-u4(2,end))/(u4(2,end)-u3(2,end))));
%     P(i,2,4)=log2(abs((u6(2,end)-u5(2,end))/(u5(2,end)-u4(2,end))));
%     P(i,2,5)=log2(abs((u7(2,end)-u6(2,end))/(u6(2,end)-u5(2,end))));
%       
%     P(i,3,1)=log2(abs((u3(3,end)-u2(3,end))/(u2(3,end)-u1(3,end))));
%     P(i,3,2)=log2(abs((u4(3,end)-u3(3,end))/(u3(3,end)-u2(3,end))));
%     P(i,3,3)=log2(abs((u5(3,end)-u4(3,end))/(u4(3,end)-u3(3,end))));
%     P(i,3,4)=log2(abs((u6(3,end)-u5(3,end))/(u5(3,end)-u4(3,end))));
%     P(i,3,5)=log2(abs((u7(3,end)-u6(3,end))/(u6(3,end)-u5(3,end))));
%         
%     P(i,4,1)=log2(abs((u3(4,end)-u2(4,end))/(u2(4,end)-u1(4,end))));
%     P(i,4,2)=log2(abs((u4(4,end)-u3(4,end))/(u3(4,end)-u2(4,end))));
%     P(i,4,3)=log2(abs((u5(4,end)-u4(4,end))/(u4(4,end)-u3(4,end))));
%     P(i,4,4)=log2(abs((u6(4,end)-u5(4,end))/(u5(4,end)-u4(4,end))));
%     P(i,4,5)=log2(abs((u7(4,end)-u6(4,end))/(u6(4,end)-u5(4,end))));
%     
%     P(i,5,1)=log2(abs((u3(5,end)-u2(5,end))/(u2(5,end)-u1(5,end))));
%     P(i,5,2)=log2(abs((u4(5,end)-u3(5,end))/(u3(5,end)-u2(5,end))));
%     P(i,5,3)=log2(abs((u5(5,end)-u4(5,end))/(u4(5,end)-u3(5,end))));
%     P(i,5,4)=log2(abs((u6(5,end)-u5(5,end))/(u5(5,end)-u4(5,end))));
%     P(i,5,5)=log2(abs((u7(5,end)-u6(5,end))/(u6(5,end)-u5(5,end))));
%     
%     pp1(i,:)=P(i,1,:);
%     pp2(i,:)=P(i,2,:);
%     pp3(i,:)=P(i,3,:);
%     pp4(i,:)=P(i,4,:);    
%     pp5(i,:)=P(i,5,:);
%      
%     figure; grid on;; hold on;
%     plot(1:1:5, pp1(i,:), '*--');
%     plot(1:1:5, pp2(i,:), 'k*--');
%     plot(1:1:5, pp3(i,:), 'r*--');
%     plot(1:1:5, pp4(i,:), 'g*--');
%     plot(1:1:5, pp5(i,:), 'm*--');
%     title('Без автоматизации')
% 
% end

%%
u0 = [0; ub*r1/(r1+r2); ub*r1/(r1+r2); ub; 0; 0];
G=[-c1 c1 0 0 0 0;c1 -c1 0 0 0 0;0 0 -c2 0 0 0;0 0 0 -c3 c3 0;0 0 0 c3 -c3 0;0 0 0 0 0 1];

A=[1/2 (1+i)/2];
for i=1:1:2
    T=0:1/5000:0.1;
    u1=rozenbrok(@F1, u0, T, A(1), G);
    T=0:1/10000:0.1;
    u2=rozenbrok(@F1, u0, T, A(1), G);
    T=0:1/20000:0.1;
    u3=rozenbrok(@F1, u0, T, A(1), G);
    T=0:1/40000:0.1;
    u4=rozenbrok(@F1, u0, T, A(1), G);
    T=0:1/80000:0.1;
    u5=rozenbrok(@F1, u0, T, A(1), G);
    T=0:1/160000:0.1;
    u6=rozenbrok(@F1, u0, T, A(1), G);
%     T=0:1/320000:0.1;
%     u7=rozenbrok(@F1, u0, T, A(1), G);

    P(i,1,1)=log2(abs((u3(1,end)-u2(1,end))/(u2(1,end)-u1(1,end))));
    P(i,1,2)=log2(abs((u4(1,end)-u3(1,end))/(u3(1,end)-u2(1,end))));
    P(i,1,3)=log2(abs((u5(1,end)-u4(1,end))/(u4(1,end)-u3(1,end))));
    P(i,1,4)=log2(abs((u6(1,end)-u5(1,end))/(u5(1,end)-u4(1,end))));
%     P(i,1,5)=log2(abs((u7(1,end)-u6(1,end))/(u6(1,end)-u5(1,end))));
    
    P(i,2,1)=log2(abs((u3(2,end)-u2(2,end))/(u2(2,end)-u1(2,end))));
    P(i,2,2)=log2(abs((u4(2,end)-u3(2,end))/(u3(2,end)-u2(2,end))));
    P(i,2,3)=log2(abs((u5(2,end)-u4(2,end))/(u4(2,end)-u3(2,end))));
    P(i,2,4)=log2(abs((u6(2,end)-u5(2,end))/(u5(2,end)-u4(2,end))));
%     P(i,2,5)=log2(abs((u7(2,end)-u6(2,end))/(u6(2,end)-u5(2,end))));
      
    P(i,3,1)=log2(abs((u3(3,end)-u2(3,end))/(u2(3,end)-u1(3,end))));
    P(i,3,2)=log2(abs((u4(3,end)-u3(3,end))/(u3(3,end)-u2(3,end))));
    P(i,3,3)=log2(abs((u5(3,end)-u4(3,end))/(u4(3,end)-u3(3,end))));
    P(i,3,4)=log2(abs((u6(3,end)-u5(3,end))/(u5(3,end)-u4(3,end))));
%     P(i,3,5)=log2(abs((u7(3,end)-u6(3,end))/(u6(3,end)-u5(3,end))));
        
    P(i,4,1)=log2(abs((u3(4,end)-u2(4,end))/(u2(4,end)-u1(4,end))));
    P(i,4,2)=log2(abs((u4(4,end)-u3(4,end))/(u3(4,end)-u2(4,end))));
    P(i,4,3)=log2(abs((u5(4,end)-u4(4,end))/(u4(4,end)-u3(4,end))));
    P(i,4,4)=log2(abs((u6(4,end)-u5(4,end))/(u5(4,end)-u4(4,end))));
%     P(i,4,5)=log2(abs((u7(4,end)-u6(4,end))/(u6(4,end)-u5(4,end))));
    
    P(i,5,1)=log2(abs((u3(5,end)-u2(5,end))/(u2(5,end)-u1(5,end))));
    P(i,5,2)=log2(abs((u4(5,end)-u3(5,end))/(u3(5,end)-u2(5,end))));
    P(i,5,3)=log2(abs((u5(5,end)-u4(5,end))/(u4(5,end)-u3(5,end))));
    P(i,5,4)=log2(abs((u6(5,end)-u5(5,end))/(u5(5,end)-u4(5,end))));
%     P(i,5,5)=log2(abs((u7(5,end)-u6(5,end))/(u6(5,end)-u5(5,end))));

    pp1(i,:)=P(i,1,:);
    pp2(i,:)=P(i,2,:);
    pp3(i,:)=P(i,3,:);
    pp4(i,:)=P(i,4,:);    
%     pp5(i,:)=P(i,5,:);
    
    figure; grid on;; hold on;
    plot(1:1:4, pp1(i,:), '*--');
    plot(1:1:4, pp2(i,:), 'k*--');
    plot(1:1:4, pp3(i,:), 'r*--');
    plot(1:1:4, pp4(i,:), 'g*--');
%     plot(1:1:5, pp5(i,:), 'm*--');
    title('С автоматизацией')
end

