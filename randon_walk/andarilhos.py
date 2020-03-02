#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
@author: Bruno Bigai Cestari

Random Walk
"""

import numpy as np
import matplotlib.pyplot as plt
from random import random
from numpy import linspace

M = 1e3 # numero de andarilhos

dt = 0.1
ds = 0.1

t = linspace(0, M*dt, M) # gera um array de dimensão M+1 dos valores 0 até M

A = np.ndarray(shape = (3,M), dtype = float)
A[:,:] = 0.0

for i in range(3):
	for j in range(1, int(M)):
		if random() > 0.5:
			A[i,j] = A[i,j-1] + ds
		else:
			A[i,j] = A[i,j-1] - ds
   
fig = plt.figure()
axes = fig.add_axes([0.1, 0.1, 0.8, 0.8])

axes.set_xlabel(u"Tempo(s)")
axes.set_ylabel(u"Distância(m)")

axes.plot(t, A[0,:], 'r-', label = "Andarilho A")
axes.plot(t, A[1,:], 'g-', label = "Andarilho B")
axes.plot(t, A[2,:], 'b-', label = "Andarilho C")

axes.legend(loc = 0)

fig.show()
fig.savefig("andarilhos.jpg")

