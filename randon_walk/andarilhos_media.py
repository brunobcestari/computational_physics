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

M = 5e3 # numero de andarilhos
T = 1000 # tempo

dt = 0.1
ds = 0.1

t = linspace(0, T*dt, T) # gera um array de dimensão M+1 dos valores 0 até M

A = np.ndarray(shape = (M,T), dtype = float)
A[:,:] = 0.0

for i in range(int(M)):
	for j in range(1, T):
		if random() > 0.5:
			A[i,j] = A[i,j-1] + ds
		else:
			A[i,j] = A[i,j-1] - ds
 

########################## MEDIA ############################

media = np.ndarray(shape = (1,T), dtype = float)
media[:] = 0.0

media2 = np.ndarray(shape = (1,T), dtype = float)
media2[:] = 0.0

for i in range(T):
    for j in range(int(M)):
        media[0,i] += A[j,i]/M
        media2[0,i] += (A[j,i]**2)/M

########################## PLOTANDO #########################
  
fig = plt.figure()
axes = fig.add_axes([0.1, 0.1, 0.8, 0.8])

axes.set_xlabel(u"Tempo(s)")
axes.set_ylabel(u"Distância(m)")

axes.plot(t, media[0,:], 'r-', label = r"$<x>$")
axes.plot(t, media2[0,:], 'g-', label = r"$<x^2>$")

axes.legend(loc = 0)

fig.show()
fig.savefig("andarilhos_medias2.jpg")

#############################################################