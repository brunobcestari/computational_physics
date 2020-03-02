# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
/home/bcestari/.spyder2/.temp.py
"""

from numpy import zeros, exp

tf = 0.5 # tempo final

############## metodo de Euler

dte = 0.025 # dt do metodo de Euler
ne = tf / dte # numero de passos no método de euler

ye = zeros([1, int(ne+1)])
ye[0,0] = 0.5 # condição inicial

te = zeros([1, int(ne+1)])

for i in range(int(ne)):
    te[0,i+1] = te[0,i] + dte
    ye[0,i+1] = ye[0,i] + (ye[0,i] - te[0,i]**2 + 1) * dte
    
    
############### metodo de Runge-Kutta
    
dtr = 0.1 #dt do metodo de Runge-Kutta
nr = tf / dtr # numero de passos no metodo de runge-kutte

yr = zeros([1, int(nr+1)])
yr[0,0] = 0.5 # condição inicial

tr = zeros([1, int(nr+1)])

k1 = 0.0
k2 = 0.0
k3 = 0.0
k4 = 0.0

for i in range(int(nr)):
    tr[0,i+1] = tr[0,i] + dtr
    k1 = yr[0,i] - (tr[0,i]**2) + 1
    k2 = yr[0,i] + k1 * dtr / 2 - (tr[0,i] + dtr/2)**2 + 1
    k3 = yr[0,i] + k2 * dtr / 2 - (tr[0,i] + dtr/2)**2 + 1
    k4 = yr[0,i] + k3 * dtr - (tr[0,i] + dtr)**2 + 1
    yr[0,i+1] = yr[0, i] + (dtr / 6) * (k1 + 2*k2 + 2*k3 + k4)
    
############### forma exata
    
dt = 0.025
n = tf/dt

y = zeros([1,n+1])

t = zeros([1,n+1])

for i in range(int(n+1)):
    t[0,i] = t[0,i-1] + dt
    y[0,i] = 1 + 2*t[0,i-1] + (t[0,i-1]**2) - (0.5*exp(t[0,i-1]))