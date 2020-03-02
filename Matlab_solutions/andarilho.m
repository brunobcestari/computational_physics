#Andarilhos
clear all
clc
tic
andarilhos=3;
dx=0.1;
dt=1000;
x=zeros(andarilhos,dt);
moeda=rand(andarilhos,dt);
for j=2:dt;
	for i=1:andarilhos;
		if moeda(i,j)<0.5
				x(i,j)=x(i,j-1)+dx;
			else
				x(i,j)=x(i,j-1)-dx;
		end
	end
end
hold all
for i=1:andarilhos;
	plot(x(i,:))
end
toc
