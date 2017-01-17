
# -*- coding: utf-8 -*- 

# install pandas
pip install wheel
pip install pandas



# read dsv file and print the last/first n lines

import pandas as pd

def test_run():
    df = pd.read_csv("/Users/suyang/Downloads/table.csv")
    print df.tail()
    # print df.tail(n)
    # print df.head(n)
    # print df[1:10] # print the line 1 to line 9
    
if __name__ == "__main__":  # http://stackoverflow.com/questions/419163/what-does-if-name-main-do
    test_run()


## plot stock data 

import pandas as pd 
import matplotlib.pyplot as plt

def test_run():
    df = pd.read_csv("/Users/suyang/Downloads/table.csv")
    print df['Adj Close']
    df['Adj Close'].plot()
    # df[['Adj Close','Close']].plot() # plot two columns in one plot
    plt.show()
        
if __name__ == "__main__":
    test_run()
