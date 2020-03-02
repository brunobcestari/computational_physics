# -*- coding: utf-8 -*-
"""
Created on Wed Feb  5 16:53:45 2014

@author: bruno
"""

from scipy import *
from scipy.integrate import odeint, ode
import matplotlib.pyplot as plt

def dy(y, t, zeta, w0):
    
    x, p = y[0], y[1]
    
    dx = p
    dp = -2 * zeta * w0 * p - w0**2 * x
    
    return [dx, dp]
    
y0 = [1.0, 0.0]

t = linspace(0, 10, 1000)
w0 = 2*pi*1.0

y1 = odeint(dy, y0, t, args=(0.0, w0)) # não amortecido
y2 = odeint(dy, y0, t, args=(0.2, w0)) # subcrítico
y3 = odeint(dy, y0, t, args=(1.0, w0)) # crítico
y4 = odeint(dy, y0, t, args=(5.0, w0)) # supercrítico

fig, ax = plt.subplots()
ax.plot(t, y1[:,0], 'k', label="nao amortecido", linewidth=0.25)
ax.plot(t, y2[:,0], 'r', label="subcritico")
ax.plot(t, y3[:,0], 'b', label="critico")
ax.plot(t, y4[:,0], 'g', label="supercritico")
ax.legend();

ax.set_title("Tipos de amortecimento")
ax.set_xlabel("tempo")
ax.set_ylabel("amplitude")

plt.show()
