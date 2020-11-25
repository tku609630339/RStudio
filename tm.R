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


text
text2
library(tm)
library(stringr)
library(wordcloud)
stopwords()

a
b<-paste(a,collapse = " ")
b


str(str_split(b,pattern = "\\s+"))

postwords<-scan('positive-words.txt',what = 'character')
postwords1<-readLines('positive-words.txt')
identical(postwords,postwords1)
negwords<-readLines('negative-words.txt')
sum(!is.na)
