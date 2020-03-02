# -*- coding: utf-8 -*-
"""
Created on Thu Jan 30 19:41:47 2014

@author: bruno bigai cestari

Placas planas carregadas

"""

from pylab import *
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.axes3d import Axes3D

nx = zeros(100)
ny = zeros(100)

V,V1=meshgrid(nx,ny,indexing='ij')
        
h=0
c=10
h1=[100]
a=0

while c>10**(-8):
    
    h+=1
    
    a=abs(V).max()
    
    h1.append(a)

      
    for i in range(30,70):
        for j in range(25,35):
            V[i,j]=-4
    
    for i in range(30,70):
        for j in range(65,75):
            V[i,j]=4
            
    for i in range(2,99):
        for j in range(2,99):
            V[i,j]=0.25*(V[i,j+1]+V[i,j-1]+V[i+1,j]+V[i-1,j])
        
    c=abs((abs(V)).max()-abs(h1[h-1]))

x=linspace(0, 100, 100)
y=linspace(0, 100, 100)
X,Y=meshgrid(x, y)

################# Contour n################
#  
#fig, ax = plt.subplots()
#
#cnt = contour(V, cmap=cm.RdBu, vmin=V.min(), vmax=abs(V).max(), extent=[0, 1, 0, 1])

################# Pcolor n################
#fig, ax = plt.subplots()
#
#p = ax.pcolor(X, Y, V, cmap=cm.RdBu, vmin=V.min(), vmax=V.max())
#cb = fig.colorbar(p, ax=ax)


################# 3D plot n################

fig = plt.figure()

ax = fig.add_subplot(1,1,1,projection='3d')
p = ax.plot_surface(X, Y, V, rstride=1, cstride=1, cmap=cm.coolwarm, linewidth=0, antialiased=False)
cb = fig.colorbar(p, shrink=0.5)

ax.set_zlabel("V")


############################################

ax.set_xlabel("X")
ax.set_ylabel("Y")

ax.set_title("Placas planas carregadas")

fig.savefig("placas_planas.jpg")