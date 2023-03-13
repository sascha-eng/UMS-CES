## Pre-process data

# Step 1: Import data set 
ess <- rio::import(here::here("data", "ESS10.csv"))


# Step 2: Inspect data and make use of the ESS codebook 
View(ess)


# Step 3: Create new data set ess_1 for further analysis

library(tidyverse) # Load the tidyverse package

ess_1 <- ess %>% 
  select(idno, vote, polintr, gndr, agea, domicil, region, eisced, cntry, ctzcntr) %>%  # select variables
  filter(cntry == "CH") %>%  # restrict sample to Switzerland
  filter(ctzcntr == 1) %>% # restrict sample to Swiss citizens 
  filter(vote %in% c(1,2)) %>%  # restrict to "yes" and "no" votes
  filter(!polintr %in% c(7,8,9)) %>%  # exclude values 7, 8, and 9
  filter(!agea %in% c(16,17,999)) %>% # exclude ages 16 and 17 and value 999
  filter(!domicil %in% c(7,8,9)) %>%  # exclude values 7, 8, and 9
  # Create factor variables 
  mutate(vote = factor(vote, levels = c(1,2), labels = c("Yes","No"))) %>% 
  mutate(polintr = fct_rev(factor(polintr, ordered = TRUE, levels = c(1,2,3,4), # reverse the order of factor levels by using fct_rev() 
                                  labels = c("Very interested",
                                             "Quite interested",
                                             "Hardly interested",
                                             "Not at all interested")))) %>%
  
  mutate(gndr = factor(gndr, levels = c(1,2), labels = c("Male", "Female"))) %>% 
  mutate(domicil = factor(domicil, levels = c(1:5), labels = c("1","2","3","4","5"))) %>%  
  mutate(domicil = fct_collapse(domicil, Urban = c(1,2,3), Rural = c(4,5))) %>% 
  mutate(region = recode_factor(as.factor(region), 
                                CH01 = "Lake Geneva",
                                CH02 = "Middleland",
                                CH03 = "North-West",
                                CH04 = "Zurich",
                                CH05 = "Eastern Part",
                                CH06 = "Central Part",
                                CH07 = "Ticino")) %>% 
  mutate(eisced = factor(eisced, ordered = TRUE, labels = c("ES-ISCED I",
                                                            "ES-ISCED II",
                                                            "ES-ISCED IIIb",
                                                            "ES-ISCED IIIa",
                                                            "ES-ISCED IV",
                                                            "ES-ISCED V1",
                                                            "ES-ISCED V2"))) %>% 
  rename(educ = eisced)


# Step 4: Inspect the new data set 

head(ess_1, 10)
str(ess_1) 
summary(ess_1)
View(ess_1)