clear all
clc

% 	Equação de onda
% 	Bruno Bigai Cestari



%		Declaração de variáveis

L=4; 		%	comprimento da corda
v=300;		%	velocidade da onda
dx=0.01;	%	incremento de espaço
r=1;		%	não sei o que é...
d=L/30;		%	densidade da corda
x0=L/3;		%	posição inicial do pulso

dt=(r*dx)/v;
n=ceil(L/dx);

x=zeros(n);

f=zeros(n,n);


%	discretização da corda
for i=1:n
	x(i)=i*dx;
end


%	estado inicial da corda
for j=1:2
	for i=1:n
	f(i,j)=exp((-(i*dx-(x0)).^2)/d);
	end
end


%	movimento
l=0;
for j=2:2*n
	for i=2:n-1
		f(i,j+1)=2*(1-r^2).*f(i,j)+(r^2).*(f(i+1,j)+f(i-1,j))-f(i,j-1);
	end
	plot(f(:,j))
	axis([0 n -1 1])
	axis manual
	l=l+1;
	print(1, '-dpng', '-S640,480', strcat('/home/bruno/brunobcestari@gmail.com/Fisica\ Computacional\ 2/grafico_corda/', num2str(l), '.png'));
end
