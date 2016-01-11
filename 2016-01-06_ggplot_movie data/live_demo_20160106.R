library(readr)
library(dplyr)
library(ggplot2)


# read data ---------------------------------------------------------------

data_movie <- read_tsv("_data/movie_data/data_movie.txt")
data_movie <- data_movie %>% 
  rename(movie_name = `片名`,
         nation = `國別`,
         release_date =`上映日期`,
         box_office = `週末票房`)
data_vol <- read_tsv("_data/movie_data/data_vol.txt") %>% 
  rename(movie_name = `Movie Name`)
  

data_merged <- left_join(data_vol, data_movie, by="movie_name")


# data manipulation -------------------------------------------------------

data_1 <- data_merged %>% 
  mutate(week_b4_release = 
           as.integer(floor((Date - release_date)/7))) %>% 
  group_by(movie_name, week_b4_release) %>% 
  summarise(vol_by_week = sum(Volume, na.rm = TRUE)) %>% 
  ungroup()


# plot --------------------------------------------------------------------

ggplot(data_1, aes(x = week_b4_release,
                        y = vol_by_week)) +
  aes(colour = movie_name, group = movie_name) +
  geom_line() +
  # scale_x_discrete(limits = (-12:11),
  #                  breaks = (-12:11)) +
  facet_grid(movie_name ~.) +
  theme(text = element_text(family = "STHeiti"))

ggplot(data_merged, aes(x = week_b4_release,
                        y = vol_by_week)) 

# plot22 ------------------------------------------------------------------

data_2 <- left_join(data_movie %>% 
                      mutate(is_tw = ifelse(
                        nation == "TAIWAN",
                        "TW",
                        "not_TW")), 
                    data_1 %>% 
                      filter(week_b4_release == -1) %>% 
                      select(-week_b4_release),
                    by = "movie_name")


ggplot(data_2, aes(vol_by_week, box_office)) +
  aes(colour = is_tw) +
  geom_point(position = "jitter",
             alpha = 0.5,
             size = 4)


