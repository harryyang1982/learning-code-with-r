if(!require("wordcloud")) install.packages("wordcloud")
library(wordcloud)

word <- c("인천광역시", "강화군", "옹진군")
frequency <- c(651, 85, 61)

wordcloud(word, frequency, colors="blue")

wordcloud(word, frequency, random.order=F, random.color=F, 
          colors=rainbow(length(word)))

if(!require("RColorBrewer")) install.packages("RColorBrewer")
library(RColorBrewer)

pal2 <- brewer.pal(8, "Dark2")

wordcloud(word, frequency, colors=pal2)

data <- read.csv(file.choose(), header=T, stringsAsFactors = F)
data2 <- data[-2,]
colnames(data2) <- data2[1,]
data2 <- data2[-1,]
head(data2)

x <- grep("구$", data2$`행정구역(시군구)별`)
data3 <- data2[-c(x),]
head(data3)

data4 <- data3[data3$`순이동 (명)`>0, ]

word <- data4$`행정구역(시군구)별`
frequency <- as.numeric(data4$`순이동 (명)`)

wordcloud(word, frequency, colors=pal2)

data5 <- data3[data3$`순이동 (명)`<0, ]
word <- data5$`행정구역(시군구)별`
frequency <- abs(as.numeric(data5$`순이동 (명)`))
wordcloud(word, frequency, colors=pal2)


# 연설문

if(!require("KoNLP")) install.packages("KoNLP")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useSejongDic()

pal2 <- brewer.pal(8, "Dark2")
text <- readLines(file.choose())

head(text)

noun <- sapply(text, extractNoun, USE.NAMES = F)
noun

noun2 <- unlist(noun)
noun2

word_count <- table(noun2)
word_count

head(sort(word_count, decreasing=T), 10)
wordcloud(names(word_count), freq=word_count, scale=c(6,0.3), min.freq=3, random.order=F, rot.per=.1, colors=pal2)

mergeUserDic(data.frame(c("정치"), c("ncn")))

noun <- sapply(text, extractNoun, USE.NAMES = F)
noun2 <- unlist(noun)

noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("오늘", "", noun2)

noun2 <- Filter(function(x) {nchar(x)>=2}, noun2)

word_count <- table(noun2)
wordcloud(names(word_count), freq=word_count, scale=c(6, 0.3), min.freq=3,
          random.order=F, rot.per=.1, colors=pal2)

# 김대중

text <- readLines(file.choose())

head(text)
noun <- sapply(text, extractNoun, USE.NAMES = F)
noun2 <- unlist(noun)

word_count <- table(noun2)
wordcloud(names(word_count), freq=word_count, scale=c(6, 0.3), min.freq=3,
          random.order=F, rot.per=.1, colors=pal2)

noun2 <- gsub("오늘세", "", noun2)
noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("우리", "", noun2)

noun2 <- Filter(function(x) {nchar(x) >=2}, noun2)

word_count <- table(noun2)
wordcloud(names(word_count), word_count, scale=c(6,0.3),
          min.freq=3, random.order=F, rot.per=.1, colors=pal2)
