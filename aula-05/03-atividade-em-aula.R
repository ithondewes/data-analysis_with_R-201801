library(tidyverse)
library(lubridate)
library(magrittr)
library(Hmisc)

ted_talks_recentes <- read_csv("aula-05/data/ted_main.csv.gz")

summary(ted_talks_recentes)



ted_talks_recentes %>%
mutate(duration = as.duration(duration),
film_date = as_datetime(film_date),
published_date = as_datetime(published_date)) -> ted_talks_recentes



ted_talks_recentes %>%
  mutate( ano = year( published_date)) %>%
  filter(ano >= 2012 & ano <= 2017) %>%
  ggplot(aes( x = views )) +
  geom_bar( alpha=0.6 ) +
  scale_x_continuous(labels = scales::format_format(big.mark = ".", decimal.mark=",",scientific = FALSE)) +
  geom_histogram(breaks = seq(from = 50000, to = 50000000, by = 100000)) +
  facet_wrap (~ ano, ncol = 2 ) +
  labs( title = "Visualizações por ano" ) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
