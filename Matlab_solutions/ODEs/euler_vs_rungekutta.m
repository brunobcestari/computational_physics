%Metodo de Euler vs Runge-Kutta 4 ordem
%Equação y'(t)=y(t)-t²+1 ; y(0)=0.5
%0<=t<=0.5
clear all
clc
format long
tf=0.5;
%método de euler
dte=0.025;
ne=tf/dte;
ye=zeros(1,ne);
ye(1,1)=0.5;
te=zeros(1,ne);
for i=1:ne
	te(1,i+1)=te(1,i)+dte;
	ye(1,i+1)=ye(1,i)+(ye(1,i)-te(1,i).^2+1).*dte;
end
%método de runge-kutta
dtr=0.1;
nr=tf/dtr;
yr=zeros(1,nr);
yr(1,1)=0.5;
tr=zeros(1,nr);
for i=1:nr
	tr(1,i+1)=tr(1,i)+dtr;
	k1=yr(1,i)-(tr(1,i).^2)+1;
	k2=yr(1,i)+k1.*dtr./2-(tr(1,i)+dtr./2).^2+1;
	k3=yr(1,i)+k2.*dtr./2-(tr(1,i)+dtr./2).^2+1;
	k4=yr(1,i)+k3.*dtr-(tr(1,i)+dtr).^2+1;
	yr(1,i+1)=yr(1,i)+(dtr./6).*(k1+2*k2+2*k3+k4);
end
%forma exata
dt=0.025;
n=tf/dt;
y=zeros(1,n);
t=zeros(1,n);
y(1,1)=0.5;
for i=2:n+1
	t(1,i)=t(1,i-1)+dt;
	y(1,i)=1+2.*t(1,i)+(t(1,i).^2)-(0.5.*exp(t(1,i)));
end

