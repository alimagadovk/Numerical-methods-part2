clear
k0=1;
k1=0;
N=128;
a=-1; b=1;
eps=10^-3;
u0=zeros(N+1,1);
u=MmNewton(@f5, u0, N, a, b, k0, k1, eps)

figure; hold on; grid on;
x=a:2/N:b;
plot(x,u)