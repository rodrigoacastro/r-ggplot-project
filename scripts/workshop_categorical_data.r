# categorical data

library(tidyverse)

getwd()
dir()

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

# scatter plots
ggplot(data=interviews_plotting,
  aes (x=no_membrs,y=number_items)) +
  geom_point(alpha=0.5)
)


# bar plots
ggplot(data=interviews_plotting,
       aes (x=respondent_wall_type,fill=village)) +
  geom_bar(position="dodge")




# 4 different graphs
ggplot(data=interviews_plotting,
       aes (x=village,fill=village)) +
  geom_bar(position="dodge") + facet_wrap(~ respondent_wall_type)


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

ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, y = rooms)) +
  geom_boxplot() +
  geom_jitter(alpha=0.5,width = 0.2, height = 0.2, aes(color = village))


# adding colors
ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, y = rooms,fill=village)) +
  geom_boxplot() +
  geom_jitter(alpha=0.5,width = 0.2, height = 0.2, color = "tomato")



ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, y = rooms,color=village)) +
  geom_boxplot() +
  geom_jitter(alpha=0.5,width = 0.2, height = 0.2, color = "tomato")



ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, y = liv_count)) +
  geom_boxplot() +
  geom_jitter(alpha=0.5,width = 0.2, height = 0.2, 
  aes(color = memb_assoc))


# separates points per boxplot
ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, y = liv_count,
           fill=memb_assoc, color = memb_assoc)) +
  geom_boxplot(alpha=0.5) +
  geom_point(alpha = 0.5,
             position = position_jitterdodge(jitter.width = 0.1, 
                                             jitter.height = 0.1))


# graph without counts
ggplot(data = interviews_plotting,
       aes(x=respondent_wall_type, y = liv_count,
           fill=memb_assoc, color = memb_assoc)) +
  geom_boxplot(alpha=0.5) +
  geom_point(alpha = 0.5,
             position = position_jitterdodge(jitter.width = 0.1, 
                                             jitter.height = 0.1))
  geom_text(aes(label=stat(count),y=5.5),
            position = position_fill(), color = "white")


