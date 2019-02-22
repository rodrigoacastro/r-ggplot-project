# Visualizing data

# dplyr and tidyr

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
