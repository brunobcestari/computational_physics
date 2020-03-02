clear all
clc

% 	Equação de onda
% 	Bruno Bigai Cestari



%		Declaração de variáveis

L=1; 		%	comprimento da corda
v=300;		%	velocidade da onda
dx=0.01;		%	incremento de espaço
r=1;		%	não sei o que é...
d=L/30;		%	densidade da corda
x0=L/3;		%	posição inicial do pulso
x1=2*L/3;   %	posição do pulso 2

dt=(r*dx)/v;
n=ceil(L/dx);

x=zeros(n);

f=zeros(n,n);
F=zeros(n^2);


%	discretização da corda
for i=1:n
	x(i)=i*dx;
end


%	estado inicial da corda
for j=1:2
	for i=1:n
		f(i,j)=exp((-(i*dx-(x0)).^2)/d);
		f(i,j)=-exp((-(i*dx-(x1)).^2)/d);
	end
end


%	movimento

for j=2:2000
	for i=2:n-1
		f(i,j+1)=2*(1-r^2).*f(i,j)+(r^2).*(f(i+1,j)+f(i-1,j))-f(i,j-1);
	end
	
	print(1, '-dpng', '-S640,480', strcat('/home/bruno/brunobcestari@gmail.com/Fisica\ Computacional\ 2/corda2/', num2str(l), '.png'));
end
