library('jsonlite')

x.json<-'product.json'
download.file("https://data.coa.gov.tw/Service/OpenData/TransService.aspx?UnitId=ABTXmIWuosiO","productNTP.json")
#y.json<-'product1.json'
#download.file("https://data.coa.gov.tw/Service/OpenData/DataFileService.aspx?UnitId=061","productNTP1.json")



product <- fromJSON("productNTP.json")
#product1<-fromJSON("productNTP1.json")
#View(product1)



print("臺灣地區農產品生產量值(data.frame):")
name<-c(product$crop_name)
output<-c(product$output)
price<-c(product$price)
value<-c(product$output_value)
i<-data.frame(name=name,output=output,price=price,value=value)
i1<-data.frame(name=name,output=output)
i2<-data.frame(name=name,value=value)

ii<-as.data.frame(i)
ii1<-as.data.frame(i1)
#產值排序
library(dplyr)
c<- ii1 %>% 
  arrange(desc(value))

c
#c1<- ii1 %>% 
#  select()
#windows()
library(ggplot2)

pro <- table(i1$name)
barplot(pro, main="臺灣地區農產品生產量", 
        xlab="name", ylab="output", border='black',
        col='blue', ylim=c(0, 5))

pro1 <- table(i2$name)
barplot(pro1, main="臺灣地區農產品產值", 
        xlab="name", ylab="output", border='red',
        col='green', ylim=c(0, 5))
