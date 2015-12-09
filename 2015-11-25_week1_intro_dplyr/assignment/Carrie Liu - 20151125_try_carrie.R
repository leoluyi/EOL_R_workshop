library(dplyr)

## 1.篩選出Sepal.Width大於平均的資料列
iris %>%
  filter(Sepal.Width > mean(Sepal.Width))

## 2.篩選出Species是“setosa”的資料列
iris %>%
  filter(Species == "setosa")

## 3.算出Petal.Length的最大值
iris %>%
  select(Petal.Length) %>%
  max()

## 4.列出Sepal.Length 大於平均，且Species是virginica的data.frame，只顯示Petal.Length Petal.Width的欄位
iris %>%
  filter(Sepal.Length > mean(Sepal.Length) & Species == 'virginica') %>%
  select(Petal.Length, Petal.Width)
