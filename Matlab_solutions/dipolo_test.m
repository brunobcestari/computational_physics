clear all
clc
for i=1:91
	x(i)=(i-1)*0.1;
end
for j=1:91
	y(j)=(j-1)*0.1;
end
v=zeros(91);
p=zeros(91);
p(46,36)=1; %localização das cargas pontuais
p(46,56)=-1;
k=ones(91);
while max(max(abs(k-v)))>10^(-5)
	k=v;
	for i=2:90
		for j=2:90
			v(i,j)=0.25*(v(i,j+1)+v(i,j-1)+v(i+1,j)+v(i-1,j)+p(i,j));
		end
	end
	for i=1:91
		v(i,91)=0;
	end
	for j=1:91
		v(91,j)=0;
	end
	for i=1:91
		v(i,1)=0;
	end
	for j=1:91
		v(1,j)=0;
	end
end
Ex=zeros(91);
Ey=zeros(91);
for i=1:90
	for j=1:90
		Ex(i,j)=-((v(i+1,j)-v(i,j))/0.1);
	end
end
for i=1:90
	for j=1:90
		Ey(i,j)=-((v(i,j+1)-v(i,j))/0.1);
	end
end
[X,Y]=meshgrid(x,y);
contour(X,Y,v');
hold on;
quiver(X,Y,Ex',Ey');
hold off;
