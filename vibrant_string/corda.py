# Bruno Bigai Cestari
# Equacao de onda

from numpy import *
import matplotlib.pyplot as plt

fig = plt.figure()
axes = fig.add_axes([0.1,0.1,0.8,0.8])

axes.set_xlim([0,1])
axes.set_ylim([-1,1])

L = 1.0 # comprimento da corda
v = 300.0 # velocidade da onda
dx = 0.01 # incremento no espaco
r = 1.0 # 
d = L/30 # densidade da corda
x0 = L/3 # posicao inicial do pulso

NT = 2000

dt = (r*dx)/v
n = int(L/dx)

x = zeros(n)

f = zeros([n,NT])
F = zeros(n**2)

####################################

x = linspace(0,n*dx,n)

for j in (0,1):
	for i in range(n):
		f[i,j] = exp((-(i*dx-(x0))**2)/d)


for j in range(2,1999):
	for i in range(2,n-1):
		f[i,j+1]=2*(1-r**2)*f[i,j]+(r**2)*(f[i+1,j]-f[i-1,j]+f[i,j-1])

axes.plot(linspace(0,1,n),f[:,1500])
fig.show()