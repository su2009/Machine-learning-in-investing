# -*- coding: utf-8 -*- 

import urllib
import os
import pandas as pd
import datetime
import matplotlib.pyplot as plt


def fetch_data(symbol): #Not in course. Adding (mgill)
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
import urllib
import os
import pandas as pd
import datetime
import matplotlib.pyplot as plt


def fetch_data(symbol): #Not in course. Adding (mgill)
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

    df_temp = pd.read_csv(symbol_to_path(symbol), index_col='Date',
                parse_dates=True, usecols=['Date', 'Adj Close'], na_values=['nan'])
    df_temp = df_temp.rename(columns={'Adj Close': symbol})
    df = df.join(df_temp)    # use join function to select certain date range and sort the date by ascending
    df = df.dropna()
    return df


def get_rolling_mean(values, window):
    """Return rolling mean of given values, using specified window size."""
    return pd.rolling_mean(values, window)


def get_rolling_std(values, window):
    """Return rolling standard deviation of given values, using specified window size."""
    # TODO: Compute and return rolling standard deviation
    return pd.rolling_std(values, window)


def get_bollinger_bands(rm, rstd):
    """Return upper and lower Bollinger Bands."""
    # TODO: Compute upper_band and lower_band
    upper_band = rm + 2*rstd 
    lower_band = rm - 2*rstd
    return upper_band, lower_band



def test_run():
    # Choose stock symbols to read
    
    symbol = raw_input("> which stock you want to check today? please use stick not full name \n") 
    symbol_string = str(symbol)
    
    ## input date
    date_entry = raw_input("> start date? format:yyyy-mm-dd \n") 
    year, month, day = map(int, date_entry.split('-'))
    start_date = datetime.date(year, month, day)
    
    date_entry = raw_input("> end date? format:yyyy-mm-dd  \n") 
    year, month, day = map(int, date_entry.split('-'))
    end_date = datetime.date(year, month, day)
    dates = pd.date_range(start_date,end_date)
    
    window = int(raw_input("> how many days for the rolling window? please input an integer \n"))
    
    # fetch data
    fetch_data(symbol) #Download csv for symbol loading.
    df = get_data(symbol, dates)
    
    
    # calculate bolling belt
    rm = get_rolling_mean(df, window)
    rstd = get_rolling_std(df, window)
    upband, lowband = get_bollinger_bands(rm, rstd)
    
    # Plot raw SPY values, rolling mean and Bollinger Bands
    ax = df.plot(title="Bollinger Bands", label=symbol_string)
    rm.plot(label='Rolling mean', ax=ax)
    upband.plot(label='upper band', ax=ax)
    lowband.plot(label='lower band', ax=ax)

    # Add axis labels and legend
    ax.set_xlabel("Date")
    ax.set_ylabel("Price")
    ax.legend(loc='upper left')
    plt.show()
 
    
if __name__ == "__main__":
    test_run()
