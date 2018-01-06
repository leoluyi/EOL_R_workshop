# devtools::install_github("garrettgman/DSR")
library(DSR)
library(tidyr)
library(dplyr)
library(ggplot2)

table2 %>%
  spread(key, value)
# table1

stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)

stocksm <- stocks %>%
  gather(stockkkk, price11, -time)

stocksm %>%
  spread(stockkkk, price11)


# plot ---------------------------------------------------------------------

iris <- as_data_frame(iris)

irisg <- iris %>%
  gather(attrs, value3, -Species)

ggplot(irisg, aes(attrs, value3)) +
  aes(fill=Species) +
  geom_bar(stat = "identity")


# sep ---------------------------------------------------------------------

table3 %>%
  separate(rate,
           sep = "/",
           into = c("cases", "population"))


table6 %>%
  unite("n", century, year, sep="-")



table6 %>%
  mutate(n = paste(century, year, sep = ""))



# WHO ---------------------------------------------------------------------

# View(who)
who <- gather(who, "code", "value", 5:60)
who <- separate(who, code, c("new", "var", "sexage"), sep="_")
who <- separate(who, sexage, c("sex", "age"), sep=1)
# who <- spread(who, var, value)



