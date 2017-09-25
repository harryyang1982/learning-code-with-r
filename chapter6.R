if(!require("ggmap")) install.packages("ggmap")
library(ggmap)

# 지도열기

gc <- geocode(enc2utf8('서울'))

gc
class(gc)

cen <- as.numeric(gc)
class(cen)
cen

map <- get_googlemap(center=cen)
map2 <- get_googlemap(center=c(gc[[1]], gc[[2]]))
ggmap(map)
ggmap(map2)


map3 <- get_googlemap(center=c(gc[[1]], gc[[2]]), maptype="roadmap")
ggmap(map3)

# 주소지 가지고 지도 출력

gc <- geocode(enc2utf8("충청북도 단양군"))
gc















gc <- geocode(enc2utf8("충청북도 단양군"))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="terrain")
ggmap(map)

map <- get_googlemap(center=cen, maptype="roadmap")
ggmap(map, extent="device")

gc <- geocode(enc2utf8("충청북도 단양군"))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="roadmap", marker=gc)
ggmap(map, extent="device")

gc <- geocode(enc2utf8("충청북도 단양군"))
cen <- as.numeric(gc)
map <- get_googlemap(center=c(gc[[1]], gc[[2]]), maptype="roadmap", marker=gc)
ggmap(map, extent="device")

## 여러 지역(단양팔경)을 지도 위에 표시하기

library(tidyverse)

names <- c("1. 도담삼봉/석문", "2. 구담/옥순봉", "3.사인암", "4.하선암", "5.중선암", "6.상선암")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-33",
          "충청북도 단양군 단성면 월악로 3827",
          "충청북도 단양군 대강면 사인암길 2",
          "충청북도 단양군 단성면 선암계곡로 1337",
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790")

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
cen

map <- get_googlemap(center=cen, maptype="roadmap", zoom=11, marker=gc)
ggmap(map)

### 마커와 이름 표시

gmap <- ggmap(map)
gmap + geom_text(data=df,
                 aes(x=lon, y=lat),
                 size=5,
                 label=df$name)

### 범례 출력

map <- get_googlemap(center=cen, maptype="roadmap", zoom=11)
gmap <- ggmap(map, fullpage=T, legend="topright")

gmap + geom_text(data=df,
                 aes(lon, lat, color=factor(name)),
                 size=10,
                 label=seq_along(df$name))

library(ggmap)

# 지진

df <- head(quakes, 100)
df

cen <- c(mean(df$long), mean(df$lat))
gc <- data.frame(lon=df$long, lat=df$lat)

gc$lon <- ifelse(gc$lon > 180, -(360-gc$lon), gc$lon)
gc

map <- get_googlemap(center=cen, scale=1, maptype="roadmap", zoom=4, marker=gc)
ggmap(map, extent="device")

map <- get_googlemap(center=cen, scale=1, maptype="roadmap", zoom=5)
ggmap(map, fullpage=T) +
  geom_point(data=df, aes(x=long, y=lat, size=mag), alpha=0.5)

