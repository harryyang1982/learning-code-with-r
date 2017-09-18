if(!require("graphics")) install.packages("graphics")

library(graphics)

# 파이 차트

x <- c(9, 15, 20, 6)
label <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀")
pie(x, labels=label, main="부서별 영업 실적")

## ggplot way

library(tidyverse)

df <- data.frame(x, label)
ggplot(df, aes(x="", y=x, fill=label)) +
  geom_bar(stat="identity") +
  coord_polar("y", start=0)

ggplot(df, aes(x=factor(1), y=x, fill=label)) +
  geom_bar(stat="identity") +
  coord_polar(theta="y", start=1)

pie(x, init.angle=90, labels=label, main="부서별 영업 실적")

pct <- round(x/sum(x)*100)
label <- paste(label, pct)

label <- paste(label, "%", sep="")

pie(x, labels=label, init.angle=90, col=rainbow(length(x)), main="부서별 영업 실적")

pie(rep(1, 12), labels=seq(1, 12), col=heat.colors(12))
pie(rep(1, 12), labels=seq(1, 12), col=terrain.colors(12))
pie(rep(1, 12), labels=seq(1, 12), col=topo.colors(12))
pie(rep(1, 12), labels=seq(1, 12), col=cm.colors(12))

library(plotrix)

pie3D(x, labels=label, explode=0.1, labelcex=0.8, main="부서별 영업 실적")

# 바 차트

