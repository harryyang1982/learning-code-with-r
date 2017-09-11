library(ggplot2)

x <- c(9, 15, 20, 6)
label <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀")
pie(x, labels=label, main="부서별 영업 실적")

height <- c(9,15,20,6)
name <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀")

barplot(height, names.arg=name, main="부서별 영업실적", col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)")

DF <- data.frame(height, name)
DF2 <- data.frame(x, label)

# ggplot way

ggplot(DF, aes(name, height, fill=name)) +
  geom_bar(stat="identity")

ggplot(DF, aes(name, height, fill=name)) +
  geom_col()
  
ggplot(DF2, aes(x="", y=x, fill=label)) +
  geom_bar(stat="identity") +
  coord_polar(theta="y")

# 애니메이션

install.packages("animation")
library(animation)