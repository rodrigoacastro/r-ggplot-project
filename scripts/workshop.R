## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

library(tidyverse)

getwd()
dir()

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

ggplot(data=interviews_plotting)

ggplot(data=interviews_plotting,
       aes (x=no_membrs,y=number_items)) +
  geom_point()


interview_plot + 
  geom_line()

interview_plot +
  geom_bar()