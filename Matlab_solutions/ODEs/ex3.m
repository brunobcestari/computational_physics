%exercício 3
clear all
clc
m=1; %massa
h=1000; %altura
gamma=4.*(10.^(-3)); %coeficiente de atrito
g=9.875;
dt=0.1;
t(1)=0;
i=0;
f(1,1)=h; %posiçao
f(2,1)=0; %velocidade
gf=@(t,f)[f(2);gamma.*f(2).^2-m*g];
a=1;
vterm=0;
tterm=0;
k1=zeros(2,1);
k2=zeros(2,1);
k3=zeros(2,1);
k4=zeros(2,1);
while a>0
	i=i+1;
	t(i+1)=t(i)+dt;	
	k1(:,1)=gf(t(i),f(:,i));
	k2(:,1)=gf(t(i)+dt./2,f(:,i)+(k1(:,1).*dt)./2);
	k3(:,1)=gf(t(i)+dt./2,f(:,i)+(k2(:,1).*dt)./2);
	k4(:,1)=gf(t(i)+dt,f(:,1).*dt.*k3(:,1));
	f(:,i+1)=f(:,i)+(dt./6).*(k1+2.*k2+2.*k3+k4);
	a=f(1,i);
		if (abs(f(2,i)-f(2,i+1))<10.^(-2)) && (tterm==0)
				vterm=f(2,i);
				tterm=t(i);
		end
end
vterm
tterm
plot(t,f);
