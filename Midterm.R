library('jsonlite')

x.json<-'product.json'
download.file("https://data.coa.gov.tw/Service/OpenData/TransService.aspx?UnitId=ABTXmIWuosiO","productNTP.json")
#y.json<-'product1.json'
#download.file("https://data.coa.gov.tw/Service/OpenData/DataFileService.aspx?UnitId=061","productNTP1.json")



product <- fromJSON("productNTP.json")
#product1<-fromJSON("productNTP1.json")
#View(product1)



print("臺灣地區農產品生產量值(data.frame):")
year<-c(product$year)
name<-c(product$crop_name)
output<-c(product$output)
price<-c(product$price)
value<-c(product$output_value)
i<-data.frame(year=year,name=name,output=output,price=price,value=value)





i1<-data.frame(year=year,name=name,output=output)
i2<-data.frame(year=year,name=name,value=value)
i
i1
i2

ii<-as.data.frame(i)
ii1<-as.data.frame(i1)

#產值排序
order(i$value,decreasing = F)[1:5]

library(dplyr)
c<- ii1 %>% 
  arrange(desc(value))

c
#c1<- ii1 %>% 
#  select()
#資料視覺化ggplot2
windows()
library(ggplot2)
a<-i1[i1$year == "94",]%>%
  head(20)

dim(a)
#name<-a$name
grades<-table(a$name)
barplot(grades,horiz=TRUE,xlab="output", ylab="name", col = "lightblue",main="臺灣地區農產品產值", ylim=c(0, 100))

barplot(grades,col = c("lightblue","lightcyan", "lavender", "mistyrose",  "cornsilk"),legend.text = a$name,main="臺灣地區農產品產值", ylim=c(0, ))

#pro1 <- table(i2$name)
#barplot(pro1, main="臺灣地區農產品產值", 
#        xlab="name", ylab="output", border='red',
#        col='green', ylim=c(0, 20))
#v檔(轉換具BOM的UTF-8)
b<-as.data.frame(ii)
write.csv(b,file = "NTP_midterm.csv",fileEncoding = "UTF-8",row.names = F)
