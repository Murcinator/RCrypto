install.packages('rvest')
install.packages('plotrix')
install.packages('dplyr')
library('rvest')
library('plotrix')
library('dplyr')

url_cmc <- "https://coinmarketcap.com/currencies/views/all/"
url2 <- "https://api.coinmarketcap.com/v1/ticker/"

#install.packages('RJSONIO')
library('RJSONIO')
url <- "https://www.bitstamp.net/api/transactions/"
bs_data2 <- fromJSON(url2)
bs_data <- fromJSON(url)
bs_df2 <- do.call(rbind, lapply(bs_data2[2:10], data.frame, stringsAsFactors=F))
bs_df <- do.call(rbind, lapply(bs_data, data.frame, stringsAsFactors=F))
head(bs_df)
head(bs_df2)
# 
# bs_data3 = fromJSON('https://www.cryptocompare.com/api/data/coinlist')
# bs_data3 = lapply(bs_data3, function(x) {
#   x[sapply(x, is.null)] <- NA
#   unlist(x)
# })
# df_3 <-as.data.frame(do.call("cbind", bs_data3))


json_file <- lapply(bs_data2, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})

df<-as.data.frame(do.call("cbind", json_file))

install.packages("DT")
library("DT")
datatable(head(df))




install.packages("jsonlite")
library('jsonlite')

tickerdata = fromJSON(paste0("https://api.binance.com/api/v1/ticker/price?symbol=",as.character('STRAT'), "BTC"))
tickerdata = fromJSON("https://api.binance.com/api/v1/ticker/price?") # alle data van binance

# interessant -> https://www.cryptocompare.com/api/#-api-data-pricehistorical-
#######
