setwd("D:/mycode/RStudio/youbike.csv")


#install.packages("jsonlite")
library(jsonlite)
#download.file("https://quality.data.gov.tw/dq_download_json.php?nid=123026&md5_url=4d8de527a0bcd8a7b1aeae91120f021d","ubikeNTP.json")
jdata <- fromJSON("ubikeNTP.json")
UbikeData <- lapply(jdata$retVal, unlist)
UbikeData <- data.frame(do.call("rbind", UbikeData))

