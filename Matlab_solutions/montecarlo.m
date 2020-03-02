#Metodo de integracao Monte Carlo
n=1e6;
pts=rand(2,n);
s=0;
for i=1:n;
	x=pts(2,i);
	y=pts(1,i);
	if y<=sqrt(1-x.^2)
		s=s+1;
	end
end
A=s/n;
p=4*A
