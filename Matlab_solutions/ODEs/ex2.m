%exercicio 2
clear all
clc
dt=0.1;
tf=5;
n=tf/dt;
gf=@(t,V)[V(1)-V(2);t.^2-V(1)+V(2)];
f=zeros(2,n);
f(1,1)=1;
f(2,1)=-1;
t=zeros(n,1);
for i=1:n
	t(i+1)=t(i)+dt;
	k1=gf(t(i),f(:,i));
	k2=gf(t(i)+dt./2,f(:,i)+dt.*k1./2);
	k3=gf(t(i)+dt./2,f(:,i)+dt.*k2./2);
	k4=gf(t(i)+dt,f(:,i)+dt.*k3);
	f(:,i+1)=f(:,i)+(dt./6).*(k1+2.*k2+2.*k3+k4);
end
plot(t,f)
