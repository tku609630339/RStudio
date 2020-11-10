library('jsonlite')

x.json<-'product.json'

download.file("https://data.coa.gov.tw/Service/OpenData/DataFileService.aspx?UnitId=061","productNTP.json")

product <- fromJSON("productNTP.json")

#View(product)
#table(product$crop)
i<-c(product$crop)
j<-c(product$type)
x<-data.frame(month=1:12,crops=i,type=j)
x
