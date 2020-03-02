clear all
clc
for i=1:46
	x(i)=(i-1)*0.2;
end
for j=1:46
	y(j)=(j-1)*0.2;
end
v=zeros(46);
p=zeros(46);
p(23,18)=1; %localização das cargas pontuais
p(23,28)=-1;
k=ones(46);
while max(max(abs(k-v)))>10^(-5)
	k=v;
	for i=2:45
		for j=2:45
			v(i,j)=0.25*(v(i,j+1)+v(i,j-1)+v(i+1,j)+v(i-1,j)+p(i,j));
		end
	end
	for i=1:46
		v(i,46)=0;
	end
	for j=1:46
		v(46,j)=0;
	end
	for i=1:46
		v(i,1)=0;
	end
	for j=1:46
		v(1,j)=0;
	end
end
Ex=zeros(46);
Ey=zeros(46);
for i=1:45
	for j=1:45
		Ex(i,j)=-((v(i+1,j)-v(i,j))/0.2);
	end
end
for i=1:45
	for j=1:45
		Ey(i,j)=-((v(i,j+1)-v(i,j))/0.2);
	end
end
[X,Y]=meshgrid(x,y);
contour(X,Y,v');
hold on;
quiver(X,Y,Ex',Ey');
hold off;
