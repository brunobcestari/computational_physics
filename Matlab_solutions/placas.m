clear all
clc
for i=1:46
	x(i)=(i-1)*0.2;
end
for j=1:46
	y(j)=(j-1)*0.2;
end
k=0;
v=zeros(46);
v1=ones(46);
while max(max(abs(v1-v)))>10^(-5);
	v1=v;
	for i=2:45;
		for j=2:45;
			v(i,j)=0.25*(v(i,j+1) + v(i,j-1) + v(i+1,j) + v(i-1,j));
		end
	end
	for i=15:18;
		for j=15:30;
			v(i,j)=2;
		end
	end
	for i=28:31;
		for j=15:30;
			v(i,j)=-2;
		end
	end
end
surf(x,y,v')
