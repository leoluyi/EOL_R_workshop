library(readxl)
library(dplyr)
library(ggplot2)

data <- read_excel("_data/food_safety_2015_Q3.xlsx") %>%
  mutate(`發佈時間` = as.POSIXct(strptime(`發佈時間`, "%Y/%m/%d %H:%M:%S"))) %>%
  mutate(main_reply = ifelse(grepl("主文", `主文/回文`), "主文", "回文"))

data %>%
  filter(發佈時間 > as.POSIXct("2015-01-01") &
               `發佈時間` < as.POSIXct("2015-10-31")) %>%
  # select(發佈時間) %>%   # take a look
  filter(grepl("食安", 標題) | grepl("魏應充", 內容)) %>%
  filter(負面強度 != 0) %>%
  mutate(pn_ratio = 正面強度/負面強度) %>%
  ggplot(aes(x=cut(發佈時間, "week"), y=pn_ratio)) +
  aes(fill = main_reply) +
  geom_bar(stat = "summary", fun.y = "mean")  +
  facet_grid(main_reply ~.) +
  geom_hline(yintercept = 1, colour = grey, alpha = 0.5) +
  theme(text = element_text(family = "STHeiti"))







