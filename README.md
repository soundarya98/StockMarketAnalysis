# stockmarket.sop

In this project, we study the prices fluctuations of Stock Markets, and check if we can predict them to some degree of accuracy.

We started by predicting the closing price of various sectors of SENSEX using Neural Networks. 
We did this by only observing the pattern of rise and fall of the prices and not by examining their causes. 

![Neural Networks Prediction]()
We also used Monte Carlo Simulation to average over various NN outputs, and generated error bars for the predictions. This improved the accuracy considerably.
![Monte Carlo Predictions]()

Next, we studied applications of the Log Periodic Power Law and test it on previous SENSEX crashes, and wrote scripts that performed
non-linear curve fitting on BSE and NSE data and successfully obtained parameters that could accurately predict the previous crashes in the market.
![LPPL Predictions]()

The project report (Stock_Market_Analysis_Report.pdf) contains a detailed report of the codes and results obtained.  
