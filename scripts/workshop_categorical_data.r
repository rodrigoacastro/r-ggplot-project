# categorical data

library(tidyverse)

getwd()
dir()

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

ggplot(data=interviews_plotting,
  aes (x=no_membrs,y=number_items)) +
  geom_point(alpha=0.5)
)



ggplot(data=interviews_plotting,
       aes (x=respondent_wall_type,fill=village)) +
  geom_bar(position="dodge")
)

?read_csv


interviews_plotting




# 4 different graphs
ggplot(data=interviews_plotting,
       aes (x=village,fill=village)) +
  geom_bar(position="dodge") + facet_wrap(~ respondent_wall_type)
)

# 4 graphs in 1

counts = table(interviews_plotting$village, interviews_plotting$respondent_wall_type)
counts = data.frame(counts)
colnames(counts) = c("village","wall_type","Freq")

counts
str(counts)

ggplot(counts,aes(x=wall_type,y=Freq,fill=village)) + 
  geom_col(position = "dodge")


# keep going

# accumulated bars

ggplot(data = interviews_plotting,
       aes(x=village, fill = village)) +
  geom_bar(position = "dodge") +
  facet_wrap()


ggplot(data = interviews_plotting,
       aes(x=village, fill = village)) +
      geom_bar(position = "fill") +
      facet_wrap(~ respondent_wall_type)


ggplot(data = interviews_plotting,
       aes(x=village, fill = village)) +
  geom_bar(position = "dodge") +
  facet_wrap(~ respondent_wall_type)

ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, fill = village)) +
  geom_bar(position = "fill") +
  ylab("proportion") +
  stat_count (geom = "text",
              aes(label = stat(count)),
              position = position_fill(vjust = 0.5), color = "white")


ggplot(data = interviews_plotting,
       aes(x=village, fill = respondent_wall_type)) +
  geom_bar(position = "fill") +
  ylab("proportion") +
  stat_count (geom = "text",
              aes(label = stat(count)),
              position = position_fill(vjust = 0.5), color = "white")

# boxplots

ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, y = rooms)) +
  geom_boxplot() +
  geom_jitter(alpha=0.5,width = 0.2, height = 0.2, color = "tomato")

