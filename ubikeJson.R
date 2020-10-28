
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
