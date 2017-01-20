
## minimizer and plot

# -*- coding: utf-8 -*- 

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as spo


def f(x):
    y = (x - 1.5)**2 + 0.5
    print "X = {}, y = {}".format(x,y)
    return y


def test_run():
    xguess = 2.0
    min_result = spo.minimize(f, xguess, method='SLSQP', options={'disp': True})
    print "minima found at: \n"
    print "x = %f, y = %f" %(min_result.x, min_result.fun) 
    
    xplot = np.linspace(0.5,2.5,21)
    yplot = f(xplot)
    plt.plot(xplot,yplot)
    plt.plot(min_result.x, min_result.fun, 'ro')
    plt.title("Minima of an objective funtion")
    plt.show()
        
    
if __name__ == "__main__":
    test_run()
    
