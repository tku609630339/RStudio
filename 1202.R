list.of.packages <- c("data.table", "magrittr", "tidyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


library(data.table)
library(magrittr)
library(tidyr)

setwd("D:/mycode/GBIF")
BBS <- fread("occurrence.txt",sep = "\t", encoding = "UTF-8")
!all(is.na(BBS[,identifier]))

str(BBS)
BBS %<>% Filter(function(x)!all(is.na(x)), .)
EX1 <- BBS[year == 2012]
EX1 <- BBS[year == 2016]
#View(EX1)
Ex2 <- BBS[individualCount > 5]
#View(Ex2)
EX3 <- BBS[vernacularName %in% c("白頭翁", "綠繡眼", "麻雀")]
EX3.1 <- BBS[vernacularName %in% c("白頭翁", "綠繡眼", "麻雀")]
EX3.2 <- EX3.1[individualCount >5]
EX3.3 <- BBS[vernacularName %in% c("白頭翁", "綠繡眼", "麻雀")]
#View(EX3.3)
EX4 <- BBS[locationID %like% "B"]


EX1.1 <- BBS[, list(vernacularName, individualCount)]

#View(EX1.1)
EX1.2 <- BBS[, c("vernacularName", "individualCount")]
#View(EX1.2)


EX1.3 <- BBS[, .(樣點數 = uniqueN(locationID)), by = list(year,vernacularName)]
#View(EX1.3)


library(dplyr)
EX1.5 %>% select(BBS[])
