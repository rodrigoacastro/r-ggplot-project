## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

library(tidyverse)

getwd()
dir()

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

ggplot(data=interviews_plotting)

(interviews_plot <- ggplot(data=interviews_plotting,
       aes (x=no_membrs,y=number_items)) +
  	geom_point()
)


interview_plot + 
  geom_line()

interview_plot +
  geom_bar()


interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

ggplot(data = interviews_plotting)

ggplot(data = interviews_plotting,
       aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.5)

ggplot(data = interviews_plotting,
       aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5)

interviews_plot <- ggplot(data = interviews_plotting, aes(x=no_membrs, y=number-items))
geom_jitter(alpha=0.5, width = 0.15, height = 0.15)

ggsave("fig_output/membrs_item.png", interviews_plot, width = 15, height = 10,
       dpi = 72)

ggplot(data=interviews_plotting, aes(x=no_membrs, y=number_items)) +
  geom_jitter(alpha=0.5, width=0.2, height = 0.2, size=4)+
  
  ggplot(data=interviews_plotting, aes(x=no_membrs, y=number_items)) +
  geom_jitter(aes(color=village), alpha=0.5, width=0.2, height = 0.2, size=4)+
  geom_smooth(method = "lm")

ggplot(data=interviews_plotting, aes(x=no_membrs, y=number_items, color=village)) +
  geom_jitter(alpha=0.5, width=0.2, height = 0.2, size=4)+
  geom_smooth(method = "lm")

interviews_plot <- ggplot(data=interviews_plotting,
                          aes(x=no_membrs, y=number_items, color=village)) +
  geom_jitter(alpha=0.5, width=0.2, height = 0.2, size=4)+
  geom_smooth(method = "lm")

ggsave("fig_output/membrs_item.png", interviews_plot, width = 15, height = 10,
       dpi = 72)

ggplot(data = interviews_plotting,
       aes(x = rooms, y = village)) +
  geom_point(alpha = 0.5)

ggplot(data = interviews_plotting,
       aes(x = village, y = rooms)) +
  geom_jitter(alpha = 0.5)

interviews_plot <- ggplot(data=interviews_plotting,
                          aes(x=rooms, y=village, color=respondent_wall_type)) +
  geom_jitter(alpha=0.5, width=0.2, height = 0.2, size=4)+
  geom_smooth(method = "lm")

ggplot(data=interviews_plotting, aes(x=village, y=rooms)) +
  geom_jitter(aes(color=village), alpha=0.5, width=0.2, height = 0.2, size=2)+
  geom_smooth(method = "lm")

ggplot(data=interviews_plotting, aes(x=village, y=rooms)) +
  geom_jitter(aes(color=respondent_wall_type), alpha=0.5, width=0.2, height = 0.2, size=3)+
  geom_smooth(method = "lm")

ggplot(data=interviews_plotting, aes(x=respondent_wall_type, y=village)) +
  geom_jitter(aes(color=respondent_wall_type), alpha=0.5, width=0.2, height = 0.2, size=2)+
  geom_smooth(method = "lm")

ggplot(interviews_plotting, aes(x = no_membrs, fill=village))+
  geom_histogram(binwidth = 1, color="white")

ggplot(interviews_plotting, aes(x = no_membrs, y=stat(density), color=village))+
  geom_freqpoly(binwidth = 1)

ggplot(interviews_plotting, aes(x = no_membrs, fill=village, color=village))+
  geom_density(alpha=0.1)