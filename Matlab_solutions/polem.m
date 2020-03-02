clear all
clc
tic
andarilhos=2000;
ds=0.1;
n=1000;
moeda=rand(andarilhos,n);
x=zeros(andarilhos,n);
y=zeros(andarilhos,n);
for j=2:n
	for i=1:andarilhos
		if moeda(i,j)<1/4
			x(i,j)=x(i,j-1)+ds;
		end
		if moeda(i,j)>=1/4 && moeda(i,j)<1/2
			x(i,j)=x(i,j-1)-ds;
		end
		if moeda(i,j)>=1/2 && moeda(i,j)<3/4
			y(i,j)=y(i,j-1)+ds;
		end
		if moeda(i,j)>=3/4
			y(i,j)=y(i,j-1)-ds;
		end
	end
end
toc
