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

<<<<<<< HEAD

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

# violin plots
ggplot(data = interviews_plotting,
       aes(x = respondent_wall_type, y = rooms)) +
      geom_violin(alpha = 0) +
      geom_jitter(alpha = 0.5, width = 0.2, color = "tomato")
      

# per village
ggplot(data = interviews_plotting,
       aes(x = respondent_wall_type, y = rooms)) +
  geom_violin(alpha = 0) +
  geom_jitter(alpha = 0.5, width = 0.2, aes(color = village)
  )


ggplot(data = interviews_plotting,
       aes(x = respondent_wall_type, y = rooms,color = village)) +
  geom_violin(alpha = 0) +
  geom_jitter(alpha = 0.5, width = 0.2, aes(color = village)
  )

# labels fixed
ggplot ( data = interviews_plotting, 
         aes(fill = respondent_wall_type, x = village)) +
        geom_bar(position = "fill") +
        stat_count(geom = "text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color = "white") +
        labs ( x = "Village", y = "Proportion", 
                      title = "Wall type by village") +
        scale_fill_discrete(labels =c("burnt brick","cement","mud daub", "sun bricks")) +
        guides(fill=guide_legend(title="wall type",title.position = "top"))



ggplot ( data = interviews_plotting, 
         aes(fill = memb_assoc, x = respondent_wall_type)) +
  geom_bar(position = "fill") +
  stat_count(geom = "text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color = "white") +
  labs ( x = "Wall type", y = "Members associated", 
         title = "Wall type by members associated") +
  #scale_fill_discrete(labels =c("burnt brick","cement","mud daub", "sun bricks")) +
  guides(fill=guide_legend(title="members\nassociated",title.position = "top"))

# faceting

labels=c("burnt bricks","cement", "mud daub","sun bricks")

ggplot ( data = interviews_plotting, 
         aes(fill = memb_assoc, x = respondent_wall_type)) +
  geom_bar(position = "fill") +
  stat_count(geom = "text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color = "white") +
  scale_x_discrete(labels) + 
  labs ( x = "Wall type", y = "Proportion") + facet_wrap(~village,nrow=2) +
  theme(axis.text.x = element_text(angle=45,hjust=1))


# using predefined themes

# theme minimal
ggplot ( data = interviews_plotting, 
         aes(fill = memb_assoc, x = respondent_wall_type)) +
  geom_bar(position = "fill") +
  stat_count(geom = "text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color = "white") +
  scale_x_discrete(labels) + 
  labs ( x = "Wall type", y = "Proportion") + facet_wrap(~village,nrow=2) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle=45,hjust=1))

# theme bw
ggplot ( data = interviews_plotting, 
         aes(fill = memb_assoc, x = respondent_wall_type)) +
  geom_bar(position = "fill") +
  stat_count(geom = "text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color = "white") +
  scale_x_discrete(labels) + 
  labs ( x = "Wall type", y = "Proportion") + facet_wrap(~village,nrow=2) +
  theme_bw() +
  theme(axis.text.x = element_text(angle=45,hjust=1))

# theme classic
ggplot ( data = interviews_plotting, 
         aes(fill = memb_assoc, x = respondent_wall_type)) +
  geom_bar(position = "fill") +
  stat_count(geom = "text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), color = "white") +
  scale_x_discrete(labels) + 
  labs ( x = "Wall type", y = "Proportion") + facet_wrap(~village,nrow=2) +
  theme_classic() +
  theme(axis.text.x = element_text(angle=45,hjust=1))

# change size of the text and more

scale_breaks= c(0,0.5,1)

ggplot ( data = interviews_plotting, 
         aes(fill = memb_assoc, x = respondent_wall_type)) +
  geom_bar(position = "fill") +
  stat_count(geom = "text", aes(label=stat(count)),
             position = position_fill(vjust=0.5), color = "white") +
  labs ( x = "Wall type", y = "Proportion", title = "Wall type by village") + 
  facet_wrap(~village,nrow=2) +
  scale_x_discrete(labels) +
  scale_y_continuous(breaks = scale_breaks) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle=45,hjust=1,size=8,color="blue"),
        plot.title = element_text(hjust = 0.5)) +
  guides(fill=guide_legend(title="members\nassociated",title.position = "top"))


# dataset
interviews_plotting

colnames(interviews_plotting)


# plotting one more time
ggplot ( data = interviews_plotting, 
         aes(fill = no_membrs, x = years_liv)) +
  #x = years_liv, y = village,color = village
  geom_bar(position = "dodge") +
  theme_bw() +
  labs ( x = "Years of life", y = "Count", title = "Years of life by count")

  
  