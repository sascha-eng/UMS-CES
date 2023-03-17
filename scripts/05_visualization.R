##Create a visualization of the results
#requires execution of script 01-04

#install and load ggplot2
install.packages("ggplot2")
library(ggplot2)

#install and load visreg
install.packages("visreg")
library(visreg)

#testing for "age_group" ----

visreg(logitmodel, "age_group",
       gg = TRUE,
       scale = "response") +
  labs(y = "Probability to Vote",
       x = "Age Group",
       title = "Relationship of voting and age",
       subtitle = "controlling for political interest, gender, years of education and region",
       caption = "source: ESS10")
ggsave(filename = file.path("output","age_group.png"))

#testing for "eduyrs" ----

visreg(logitmodel, "eduyrs",
       gg = TRUE,
       scale = "response") +
  labs(y = "Probability to Vote",
       x = "Age",
       title = "Relationship of voting and age",
       subtitle = "controlling for political interest, gender, years of education and region",
       caption = "source: ESS10")


#testing for "polintr" ----


visreg(logitmodel, "polintr",
       gg = TRUE,
       scale = "response") +
  labs(y = "Probability to Vote",
       x = "Age",
       title = "Relationship of voting and age",
       subtitle = "controlling for political interest, gender, years of education and region",
       caption = "source: ESS10")


#testing for "region" ----

visreg(logitmodel, "region",
       gg = TRUE,
       scale = "response") +
  labs(y = "Probability to Vote",
       x = "Age",
       title = "Relationship of voting and age",
       subtitle = "controlling for political interest, gender, years of education and region",
       caption = "source: ESS10")


#testing for "gndr" ----

visreg(logitmodel, "gndr",
       gg = TRUE,
       scale = "response") +
  labs(y = "Probability to Vote",
       x = "Age",
       title = "Relationship of voting and age",
       subtitle = "controlling for political interest, gender, years of education and region",
       caption = "source: ESS10")

