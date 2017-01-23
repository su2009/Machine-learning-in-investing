# -*- coding: utf-8 -*- 

import os
import pandas as pd
import numpy as np
import urllib
import datetime as dt
# import matplotlib.pyplot as plt


def fetch_data(symbol): 
    """ Downloads .csv files for <symbols> from Yahoo Finance and saves them in 'data' directory. These are later picked up by rese of the program."""
    
    '''url = "http://ichart.finance.yahoo.com/table.csv?s="+symbol+\
    "&amp;d=1&amp;e=1&amp;f=2016&amp;g=d&amp;a=8&amp;b=7&amp;c=2000&amp;ignore=.csv"
    '''
    time_frame = "d" # d -> daily, w -> weekly, m -> monthly.
    url = "http://real-chart.finance.yahoo.com/table.csv?s="+symbol+\
            "&a=11&b=22&c=1998&d=04&e=9&f=2016&g="+time_frame+"+&ignore=.csv"

    urllib.urlretrieve(url, './data/{}.csv'.format(symbol))
    print "DEBUG: Downloading for "+symbol
    print "DEBUG: URL:"+url


def symbol_to_path(symbol, base_dir="data"):
    """Return CSV file path given ticker symbol."""
    return os.path.join(base_dir, "{}.csv".format(str(symbol)))


def get_data(symbol, dates):
    """Read stock data (adjusted close) for given symbols from CSV files."""
    df = pd.DataFrame(index=dates)
    symbol1 = ["SPY"]
    fetch_data(symbol1)
    df_SPY = pd.read_csv(symbol_to_path(symbol1, index_col='Date', parse_dates=True, usecols=['Date', 'Adj Close'], na_values=['nan'])
    
    print df  
    
    # print "print df_SPY----\n", df_SPY          
    #df = df.join(df_SPY) 
    #print "print 1----\n", df
    #df = df.dropna()
    #print "print 2----\n", df
    
    #df_temp = pd.read_csv(symbol_to_path(symbol), index_col='Date',
     #           parse_dates=True, usecols=['Date', 'Adj Close'], na_values=['nan'])
    #df_temp = df_temp.rename(columns={'Adj Close': symbol})
    #df = df.join(df_temp)    # use join function to select certain date range and sort the date by ascending
    #df = df.drop("SPY", 1)
    #print "print 3----\n", df
    return df
    
    
    
def test_run():
    symbol = ["GOOG","AAPL"]
    sd = dt.datetime(2008,1,1)
    ed = dt.datetime(2008,1,31)
    dd = [sd + dt.timedelta(days=x) for x in range((ed-sd).days + 1)]
    get_data(symbol,dd)
    



if __name__ == "__main__":
    test_run()
