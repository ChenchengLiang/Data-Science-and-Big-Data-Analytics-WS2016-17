###################################################
#1. Load the library forecast. You may have to install it.
###################################################
install.packages("forecast")
library("forecast")


###################################################
#2. Load the data with scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
###################################################
x=scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
plot(x)
lines(x)

###################################################
#3. The data is monthly and starts in the year 1946. Create an appropriate time series
#object.
###################################################
myts <- ts(x, start=c(1946, 1), frequency=12) 
plot(myts)

###################################################
#4. Decompose the data into the trend, the seasonal in
#uences and the random in
#uences.
#Plot the results of the decomposition.
###################################################


stl_myts=stl(myts, s.window="periodic")
seasonal_stl_myts=stl_myts$time.series[,1]
trend_stl_myts=stl_myts$time.series[,2]
random_stl_myts=stl_myts$time.series[,3]
plot(stl_myts)

decomposed_myts=decompose(myts,"additive")
plot(decomposed_myts)
#the original data, seasonal component, trend component and the remainder£¨random influence£© 


# additional plots
monthplot(myts)
seasonplot(myts)

###################################################
#5. Calculate an adjusted time series without the seasonal eects.
###################################################


seasonal_adjusted_myts=myts-decomposed_myts$seasonal


par(mfrow = c(2, 1))  # 3 rows and 1 columns
plot(seasonal_adjusted_myts)
plot(myts)



###################################################
#train an ARIMA model with the parameters p = q = d = 1.
###################################################
# fit an ARIMA model of order P, D, Q
model_arima = arima(seasonal_adjusted_myts, order=c(1, 1, 1))
#model_arima = arima(seasonal_adjusted_myts, order=c(1, 1, 1))
#p is the number of autoregressive terms
#d is the number of differences
#q is the number of moving average terms
model_arima_auto_unjusted_ts = auto.arima(myts)
model_arima_auto = auto.arima(seasonal_adjusted_myts)
model_arima_auto1 = auto.arima(seasonal_adjusted_myts)
# predictive accuracy

#accuracy(fit)
###################################################          
#7.Forecast the next 12 months using both trained models and plot the results (Hint:
#                                                                              forecast.Arima).
###################################################

#plot(forecast.Arima(fit,12))

par(mfrow = c(3, 1))  # 3 rows and 1 columns
plot(forecast(model_arima, 12))
plot(forecast(model_arima_auto, 12))
plot(forecast(model_arima_auto_unjusted_ts, 12))

#(forecast(model_arima_auto1, 12))
#plot(forecast(model_arima_auto_justed_stl, 12))




stl_myts=stl(myts, s.window="periodic")
seasonal_stl_myts = stl_myts$time.series[,1]
adjusted_stl = myts - seasonal_stl_myts
model_arima_auto_justed_stl = auto.arima(adjusted_stl)
