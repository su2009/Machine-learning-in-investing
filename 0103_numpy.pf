## How fast is numpy

# -*- coding: utf-8 -*- 

import pandas as pd
import numpy as np
import time

def manual_mean(data):
    t1 = time.time()
    total = 0
    for i in range(data.shape[0]):   # data.shape[0]=1000, need to add range to make it [0,1000), otherwise will show error
        for j in range(data.shape[1]):
            total = total + data[i,j]
    print "total is", total, "number is ", data.size, "mean is ", total/data.size
    t2 = time.time()
    return (t2-t1)

def function_mean(data):
    t1 = time.time()
    print "total is", data.sum(), "number is ", data.size, "mean is ", data.mean()  # note the data.size doesn't have () in the function
    t2 = time.time()
    return (t2-t1)
    
def test_run():
    a = np.random.random([1000,10000])
    man_t = manual_mean(a)
    func_t = function_mean(a)
    beishu=man_t/func_t
    print "the manual time is", man_t,  " seconds and the function time is ", func_t, "seconds"
    print "the manual time is %r times faster than function time" %beishu 
    
    
if __name__ == "__main__":
    test_run()
    
    
## simply the calcution function by combing L9 to L23

import pandas as pd
import numpy as np
import time

def manual_mean(data):
    total = 0
    for i in range(data.shape[0]):
        for j in range(data.shape[1]):
            total = total + data[i,j]
    print "total is", total, "number is ", data.size, "mean is ", total/data.size

def function_mean(data):
    print "total is", data.sum(), "number is ", data.size, "mean is ", data.mean()
    
def how_long(func, *args):
    t0 = time.time()
    result = func(*args)   # all arguments are passed in as-is
    t1 = time.time()
    return result, t1-t0
    
def test_run():
    a = np.random.random([1000,10000])
    man_result, man_t = how_long(manual_mean,a)
    func_result, func_t = how_long(function_mean,a)
    beishu=man_t/func_t
    print "the manual time is", man_t,  " seconds and the function time is ", func_t, "seconds"
    print "the manual time is %r times faster than function time" %beishu 
    

if __name__ == "__main__":
    test_run()
