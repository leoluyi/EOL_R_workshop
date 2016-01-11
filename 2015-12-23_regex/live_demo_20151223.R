library(dplyr)
library(stringr)
library(rvest)
library(httr)

## crawl PTT Gossiping article titles
gossip <- GET("https://www.ptt.cc/bbs/Gossiping/index.html",
              set_cookies(over18=1)) %>%
							.$content %>%
							read_html

(gossip_titles <- gossip %>% 
  html_nodes("div .title") %>% 
  html_text() %>% 
  iconv("UTF-8", "UTF-8"))

## cleanse title
(gossip_titles_cleansed <- gsub("\n\t*", '', gossip_titles))

# regex ---------------------------------------------


