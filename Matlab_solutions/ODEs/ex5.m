%runge-kutta para calcular posiçao de um planeta orbitando o sol
clear all
clc

g=@(t,f)[-4*(pi^2)*f(2)/((f(2)^2+f(4).^2)^(3/2));f(1);-4*(pi^2)*f(4)/((f(2).^2+f(4)^2)^(3/2));f(3)];
dt=0.1;

f(1,1)=8.8;%velocidade em x
f(3,1)=0;%velocidade em y
f(2,1)=0;%posição inicial em x
f(4,1)=1;%posição inicial em y

n=1;
t(1)=0;

while n<1000
	k1(:,1)=g(t(n),f(:,n));
	k2(:,1)=g(t(n)+dt/2,f(:,n)+dt.*k1./2);
	k3(:,1)=g(t(n)+dt/2,f(:,n)+dt.*k2./2);
	k4(:,1)=g(t(n)+dt,f(:,n)+dt.*k3);
	f(:,n+1)=f(:,n)+(dt/6).*(k1(:,1)+2.*k2(:,1)+2.*k3(:,1)+k4(:,1));
	n=n+1;
	t(n)=n*dt;
end
plot(f(2,:),f(4,:))