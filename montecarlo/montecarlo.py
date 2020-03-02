#!/usr/bin/env python
# -*- coding: UTF-8 -*-

"""
@author: Bruno Bigai Cestari

Integração por método de Monte Carlo
"""

from numpy import pi, sqrt
from random import random

n = 1e6 # precisão

c = 0.0 # contador de pontos aleatórios gerados
s = 0.0 # numeros dentro da area definida
x = 0.0 # numero aleatório

while c < n:
	c += 1
	x = random()
	y = random()
	if y <= sqrt(1 - x**2): # define uma circunferencia de diametro 1 na qual os pontos devem estar inseridos
		s += 1

A = s/n

p = 4*A # pi = A/(r**2)

print("O valor de 'pi' encontrado pelo método Monte Carlo é: " + str(p))
print("O valor exato é: " + str(pi))


