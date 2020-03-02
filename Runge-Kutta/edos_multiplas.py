# -*- coding: utf-8 -*-
"""
Created on Tue Apr 22 01:43:15 2014

@author: bcestari
"""

from numpy import *
import matplotlib.pyplot as plt

def gf(t,V):
    return array([[V[0] - V[1]], [t**2 - V[0] + V[1]]])


dt = 0.1
tf = 5
n = int(tf/dt)

f = zeros([2,n+1])
f[0,0] = 1
f[1,0] = -1

t = zeros([n+1,1])

for i in range(n):
    t[i+1] = t[i] + dt
    k1 = gf(t[i], f[:,i])
    k2 = gf(t[i] + dt/2, f[:,i] + dt*k1[:,0]/2)
    k3 = gf(t[i] + dt/2, f[:,i] + dt*k2[:,0]/2)
    k4 = gf(t[i] + dt, f[:,i] + dt*k3[:,0])
    f[:,i+1] = f[:,i] + (dt/6.0) * (k1[:,0] + 2*k2[:,0] + 2*k3[:,0] + k4[:,0])
    
plt.plot(t,f[0,:], 'r', t, f[1,:], 'b')
plt.savefig("solucao_edos.jpg")
plt.show()
