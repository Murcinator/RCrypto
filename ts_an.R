library('ggplot2')
library('forecast')
library('tseries')

# https://www.datascience.com/blog/introduction-to-forecasting-with-arima-in-r-learn-data-science-tutorials

# install.packages('ggplot2')
# install.packages('forecast')
# install.packages('tseries')
setwd("\\\\solon.prd/files/P/Global/Users/C52821/UserData/Desktop/Marc Scripts/R/ts an")
daily_data = read.csv('day.csv', header=TRUE, stringsAsFactors=FALSE)


daily_data$Date = as.Date(daily_data$dteday)

ggplot(daily_data, aes(Date, cnt)) + geom_line() + scale_x_date('month')  + ylab("Daily Bike Checkouts") +
  xlab("")


count_ts = ts(daily_data[, c('cnt')])
daily_data$clean_cnt = tsclean(count_ts)

## daily_data$clean_cnt = as.numeric(tsclean(count_ts))

ggplot() +
  geom_line(data = daily_data, aes(x = Date, y = clean_cnt)) + ylab('Cleaned Bicycle Count')

daily_data$cnt_ma = ma(daily_data$clean_cnt, order=7) # using the clean count with no outliers
daily_data$cnt_ma30 = ma(daily_data$clean_cnt, order=30)


ggplot() +
  geom_line(data = daily_data, aes(x = Date, y = clean_cnt, colour = "Counts")) +
  geom_line(data = daily_data, aes(x = Date, y = cnt_ma,   colour = "Weekly Moving Average"))  +
  geom_line(data = daily_data, aes(x = Date, y = cnt_ma30, colour = "Monthly Moving Average"))  +
  ylab('Bicycle Count')
