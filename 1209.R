
library(data.table)
library(dplyr)
library(magrittr)
Sys.getlocale()
f <- 'youbike.csv'

url <- 'https://data.ntpc.gov.tw/api/datasets/71CD1490-A2DF-4198-BEF1-318479775E8A/csv/file'
download.file(url,f)

ubike1 <- read.csv(f, header=T,fileEncoding = 'UTF-8-BOM', encoding = 'UTF-8-BOM', stringsAsFactors = F,colClasses = rep('character',14))
ubike2 <- read.table(f, header=T,fileEncoding = 'UTF-8-BOM',encoding='UTF-8-BOM',stringsAsFactors = F,colClasses = rep('character',14),sep=',')

identical(ubike1,ubike2)
ubike3 <- fread(f, header=T,encoding = 'UTF-8',stringsAsFactors=F,colClasses= rep('character',14))

identical(ubike1,as.data.frame(ubike3))

ubike1 <- ubike1 %>% mutate_all(trimws)

ubike2 <- ubike2 %>% mutate_all(trimws)

ubike3 <- ubike3 %>% mutate_all(trimws)

identical(ubike1,as.data.frame(ubike3))

fwrite(ubike3,'youbikeOK.csv',row.names = F)

write.csv(ubike3,'youbikeX.csv',fileEncoding = 'UTF-8',row.names = F)
# write.csv 仍然有編碼問題 Line 391 瓦磘溝(福真里) 踩雷!
ubike4.a <- fread('youbikeOK.csv', header=T, encoding = 'UTF-8', stringsAsFactors=F,colClasses= rep('character',14))

ubike4.b <- fread('youbikeX.csv', header=T,encoding = 'UTF-8',stringsAsFactors=F,colClasses= rep('character',14))

identical(ubike4.a,ubike4.b)

colname <- c("sno(站點代號)","sna(中文場站名稱)","tot(場站總停車格)","sbi(可借車位數)","sarea(中文場站區域)","mday(資料更新時間)","lat(緯度)","lng(經度)","ar(中文地址)","sareaen(英文場站區域)","snaen(英文場站名稱)","aren(英文地址)","bemp(可還空位數)","act(場站是否暫停營運)")

colname <- iconv(colname, "big5", "utf8") # 特別給 Windows 轉碼

names(ubike3) <- colname

fwrite(ubike3,'youbike中文欄位.csv',row.names = F,col.name=T,append=F,bom=T)

#https://atrebas.github.io/post/2019-03-03-datatable-dplyr/

library(dplyr)
set.seed(1L)

## Create a data frame (tibble)
DF <- tibble(V1 = rep(c(1L, 2L), 5)[-10],
             V2 = 1:9,
             V3 = rep(c(0.5, 1.0, 1.5), 3),
             V4 = rep(LETTERS[1:3], 3))

class(DF)
DF
#12/09==hw:Filter unique rows
unique(DT)
unique(DT, by = c("V1", "V4")) # returns all cols
distinct(DF) # distinct_all(DF)
distinct(DF, across(c(V1, V4))) # returns selected cols
# distinct_at(DF, vars(V1, V4))