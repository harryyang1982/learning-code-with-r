library(XML)
library(RCurl)

searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "CfN8qETNqGssrCiEZ2I8"
Client_Secret <- "dOJYua_unf"

query <- URLencode(iconv("여름 추천 요리", "euc-kr", "UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=20", sep="")

doc <- getURL(url,
              httpheader=c("Content-Type"="application/xml",
                           'X-Naver-Client-Id'=Client_ID,
                           'X-Naver-Client-Secret' = Client_Secret))

doc2 <- htmlParse(doc, encoding="UTF-8")
text <- xpathSApply(doc2, "//item/description", xmlValue)
text
