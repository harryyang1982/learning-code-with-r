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

ani.options(interval=1)

for(i in 10:0) {
  plot.new()
  
  rect(0, 0, 1, 1, col="yellow")
  
  text(0.5, 0.5, i, cex=5, col=rgb(.2, .2, .2, .7))
  
  ani.pause()
}

# 지도

install.packages("RgoogleMaps")
install.packages("ggmap")
library(tidyverse)
library(RgoogleMaps)
library(ggmap)

names <- c("1. 도담삼봉/석문", "2. 구담/옥순봉", "3.사인암", "4.하선암", "5.중선암", "6.상선암")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-33",
          "충청북도 단양군 단성면 월악로 3827",
          "충청북도 단양군 대강면 사인암길 2",
          "충청북도 단양군 단성면 선암계곡로 1337",
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790")

gc <- geocode(enc2utf8(addr))

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon, na.rm=T), mean(df$lat, na.rm=T))
cen

map <- get_googlemap(center=cen, maptype="roadmap", zoom=11, marker=gc)

ggmap(map, fullpage=T)

# 워드 클라우드 연설문 키워드 분석

# 동전 던지기 시뮬레이션

iteration <- 5000

plot(0, 0, xlab="동전을 던진 횟수", ylab="앞면이 나오는 비율", xlim=c(0,iteration),
     ylim=c(0,1))

abline(a=0.5, b=0, col="red")
sum <- 0

for(x in 1:iteration) {
  y <- sample(c("앞면", "뒷면"), 1, replace=T)
              if(y=="앞면") sum=sum+1
              prob<- sum/x
              points(x,prob)
}
