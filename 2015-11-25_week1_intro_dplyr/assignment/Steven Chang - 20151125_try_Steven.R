iris
library(dplyr)
iris %>%
  filter(Sepal.Width > mean(Sepal.Width))
iris %>%
  filter(Species == "setosa")
iris %>%
  select(Petal.Length) %>%
  max()
iris %>%
  filter(Sepal.Width > mean(Sepal.Width)) %>%
  select(Petal.Length, Petal.Width)
  