# -*- coding: utf-8 -*-
"""
Created on Tue Apr 22 02:56:35 2014

@author: bcestari
"""

from numpy import *
import matplotlib.pyplot as plt
import numpy as np

def g(t,f):
    return array([[-4 * (pi**2) * f[1] / ((f[1]**2 + f[3]**2)**(3 / 2))],[f[0]], [-4 * (pi**2) * f[3]/((f[1]**2 + f[3]**2)**(3/2))], [f[2]]])

dt = 0.1
f = zeros([4,1])

f[0,0] = 8.8 # velocidade em x
f[2,0] = 0 # velocidade em y
f[1,0] = 0 # posição inicial em x
f[3,0] = 1 # posição inicial em y

n=-1
t = [0,]

for n in range(1000):
    k1 = g(t[n], f[:,n])
    k2 = g(t[n] + dt/2, f[:,n] + dt * k1[:,0] / 2)
    k3 = g(t[n] + dt/2, f[:,n] + dt * k2[:,0] / 2)
    k4 = g(t[n] + dt, f[:,n] + dt * k3[:,0])
    fstack = f[:,n] + (dt/6) * (k1[:,0] + 2*k2[:,0] + 2*k3[:,0] + k4[:,0])
    f = np.column_stack((f,fstack))    
    t.append(n*dt)


plt.plot(f[1,:],f[3,:])
plt.savefig("orbita.jpg")
plt.show()
