library(dplyr)
library(readxl)

pn_value <- raw_data %>%
  dplyr::filter(grepl("魏應充", title)) %>%
  mutate(pn_value = emotion_postive/emotion_negative) %>%
  select(pn_value) %>%
  # filter(pn_value != Inf) %>%
  `[[`(1)

pn_value[(pn_value != Inf) & (!is.na(pn_value))]




