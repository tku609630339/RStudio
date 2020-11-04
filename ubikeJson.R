
#install.packages("jsonlite")
library('jsonlite')

ubike.json<-'youbike.json'
download.file("https://quality.data.gov.tw/dq_download_json.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d","ubikeNTP.json")



ubike <- fromJSON("ubikeNTP.json")
table(ubike$sarea)
x<-table(ubike$sarea)
sort(x)
sort(x,decreasing = T)
#UbikeData <- lapply(jdata$retVal, unlist)
#UbikeData <- data.frame(do.call("rbind", UbikeData))


a<-sort(x,decreasing = T)
b<-as.data.frame(a)
View(b)
write.csv(b,file = "NTP.csv",fileEncoding = "UTF-8",row.names = F)




#install.packages('data.table')
library(data.table)

download.file("https://tcgbusfs.blob.core.windows.net/blobyoubike/YouBikeTP.json",ubike.json)
ubike<-fromJSON(ubike.json)
ubike<-rbindlist(ubike$retVal)
y<-table(ubike$sarea)
sort(y)
sort(y,decreasing = T)

