library(dplyr)
iris %>% 
  filter(Sepal.Width > mean(Sepal.Width))

library(dplyr)
iris %>% 
  filter(Species == 'setosa')

library(dplyr)
iris %>%
  select(Petal.Length) %>%
  max()

library(dplyr)
iris %>%
  filter(Sepal.Length > mean(Sepal.Length)) %>%
  filter(Species == 'virginica') %>%
  select(Petal.Length, Petal.Width)



