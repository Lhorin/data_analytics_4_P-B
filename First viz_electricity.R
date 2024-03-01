dat <- read.csv("C:\\Users\\andyf\\OneDrive\\Desktop\\Fürs Studium\\9 Data Analytics\\datasets\\100233.csv", sep= ";")

nrow(dat)/365

library(tidyverse)

dat2 <- dat %>% group_by(Jahr,Monat,Tag) %>% summarize(stromverbrauch_sum = sum(Stromverbrauch))

dat2 <- dat2 %>% mutate(Time = str_c(Monat, Tag, sep = "-"))

dat2 %>% ggplot(aes(Time, stromverbrauch_sum, group = Jahr, col = factor(Jahr)))+
   geom_line()

dat2 %>% ggplot(aes(factor(Monat), stromverbrauch_sum, group = Jahr, col=factor(Jahr)))+
   geom_line()
dat2 %>% filter(Jahr == 2021 | Jahr== 2023) %>% ggplot(aes(Time, stromverbrauch_sum, group = Jahr, col = factor(Jahr)))+
   geom_line()
