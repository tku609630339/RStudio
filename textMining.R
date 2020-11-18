readLines('a.txt')
str(readLines('a.txt'))
paste(readLines('a.txt'),collapse = "@@@@$$$$@@@@")
a<-c('Hello','world','name','is','R')
a
paste(a,collapse = ' ')
text1<-paste(readLines('a.txt'),collapse = " ")
text1
gsub(pattern = "\\w",replacement = " ",text1)
strsplit(text1,' ')
strsplit(a,' ')
