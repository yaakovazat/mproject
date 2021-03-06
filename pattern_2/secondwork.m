%second laboratory work ; Student :Yaakov Azat ,yaakovazat@gmail.com 
% Teacher: Gusmanova ,F.R. 


clear;
clc;
% given parameters:

m1=-1;
m2=1;
sig=1.5;
N=100;

[xmin,xmax]=xminmax(m1,m2,sig);

xg=(m1+m2)/2;
%Реализация в Matlab: 
% the arrange qujian for x:
for i=1:N
    x(i)=xmin+(xmax-xmin)*(i-1)/(N-1);
end
 
for i=1:N
    x(i);
end

% calculate the Probablity dentisy function of class 1 and class 2 ,as fx1i
% and fx2i
fx1i=PDF(x,m1,sig);
fx2i=PDF(x,m2,sig);

% draw pictures of fx1i and fx2i :
figure
subplot(2,2,1)
plot(x,fx1i,x,fx2i);
title('Subplot 1')
hold on
title('fig for fx1i and fx2i @ x')
xlabel('x')
ylabel('fx1i,fx2i')



% juese :
[m,n]=size(x);
fg=zeros(1,100);
XG=fg+xg;
M=x-XG;
a=find(M>0);
b=find(M<=0);
M(a)=0.35;
M(b)=0;
fg=M;

% figure with fg
subplot(2,2,2)
plot(x,fx1i,x,fx2i,x,fg);
title('Subplot 1')
hold on
title('fig for fx1i and fx2i @ x')
xlabel('x')
ylabel('fx1i,fx2i,fg')
plot([xg xg],[0 0.3])
hold on
legend('fx1i','fx2i','fg')

%Norm function here:
x1i=normrnd(m1,sig,1,N);
x2i=normrnd(m2,sig,1,N);
% pilot
subplot(2,2,3)
i=1:N;
plot(i,x1i,i,x2i,i,xg);
title('Subplot 1')
hold on
title('x1i,x2i and xg @ i=1:N')
xlabel('i')
ylabel('x1i,x2i,xg')
hold on
legend('x1i','x2i','xg')


% yi>:
for j=1:N
    y1i(j)=x1i(j)/N;
end
for j=1:N
    y2i(j)=x2i(j)/N;
end

% panduan:N12
[m,n]=size(x);
fg=zeros(1,N);
XG=fg+xg;
M=y2i-XG;
c=find(M>0);
d=find(M<=0);
M(c)=1;
M(d)=0;
N12=M;

%panduan N21
[m,n]=size(x);
fg=zeros(1,N);
XG=fg+xg;
N=XG-y1i;
e=find(N>0);
f=find(N<=0);
N(e)=1;
N(f)=0;
N21=N;

% P12_e and P21_e
P12_e=N12/N;
P21_e=N21/N;
P_e=(P12_e+P21_e)/2;

% jifen 
syms z P12_t P21_t;
P12_t_1=int((1/(sqrt(2*pi)*sig))*exp((-1*(z-m1).^2)/2*(sig^2)),z,xg,xmax);
P12_t=vpa(P12_t_1);

P21_t_1=int((1/(sqrt(2*pi)*sig))*exp((-1*(z-m2).^2)/2*(sig^2)),z,xmin,xg);
P21_t=vpa(P21_t_1);

% P_t
P_t=(P12_t+P21_t)/2;


%new
new_sig=0.15;
f1ni=PDF(x,m1,sig);
f2ni=PDF(x,m2,sig);
% pilot
subplot(2,2,4)
i=1:N;
plot(i,f1ni,i,f2ni);
title('Subplot 1')
hold on
title('x1i,x2i and xg @ i=1:N')
xlabel('i')
ylabel('x1i,x2i,xg')
hold on
%legend('x1i','x2i','xg')