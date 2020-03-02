#Metodo de integracao monte carlo, numero de euler

n=1e6;
pts=rand(2,n);
s=0;
for i=1:n;
	x=pts(1,i).*9+1;
	y=pts(2,i);
	if y<=1/x
		s=s+1;
	end
end
A=s/n;
Ln10=9*A;
e=10.^(1/Ln10)
