%Media de x e x^2
clear all
clc
tic
andarilhos=5000;
dx=0.1;
dt=1000;
t=zeros(1,dt)
x=zeros(andarilhos,dt);
moeda=rand(andarilhos,dt);
med=zeros(1,dt);
med2=zeros(1,dt);
for j=2:dt;
	t(1,j)=t(1,j-1)+1;
	for i=1:andarilhos;
		if moeda(i,j)<0.5
				x(i,j)=x(i,j-1)+dx;
			else
				x(i,j)=x(i,j-1)-dx;
		end
%		med(1,j)=(x(i,j)./andarilhos);
%		med2(1,j)=((x(i,j).^2)./andarilhos);
	end
end
for j=2:dt;
	for i=1:andarilhos;
		med(1,j)=med(1,j)+(x(i,j)./andarilhos);
		med2(1,j)=med2(1,j)+(((x(i,j).^2))/andarilhos);
	end
end
toc
hold all
plot(t,med)
plot(t,med2)

