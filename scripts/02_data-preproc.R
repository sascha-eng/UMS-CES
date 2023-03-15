## Pre-process data

# Step 1: Import data set ---- 
source(here::here("scripts", "01_load-data.R"))


# Step 2: Inspect data and make use of the ESS codebook ----
 


# Step 3: Create new data set ess_1 for further analysis ----

library(tidyverse) # Load the tidyverse package

ess_1 <- ess %>%  
  select(idno, vote, polintr, gndr, agea, domicil, region, eisced, eduyrs, cntry, ctzcntr) %>%  # select variables
  filter(cntry == "CH") %>%  # restrict sample to Switzerland
  filter(ctzcntr == 1) %>% # restrict sample to Swiss citizens 
  filter(vote %in% c(1,2)) %>%  # restrict to "yes" and "no" votes
  filter(!polintr %in% c(7,8,9)) %>%  # exclude values 7, 8, and 9
  filter(!agea %in% c(16,17,999)) %>% # exclude ages 16 and 17 and value 999
  filter(!domicil %in% c(7,8,9)) %>%  # exclude values 7, 8, and 9
  filter(eduyrs %in% c(5:21)) %>% # restrict sample to 5 to 21 years of education
  # Create factor variables  
  mutate(vote = fct_rev(factor(vote, levels = c(1,2), labels = c("Yes","No")))) %>%  # create binary factor 'vote' and reverse order of factor levels using fct_rev() 
  mutate(polintr = fct_rev(factor(polintr, ordered = TRUE, levels = c(1,2,3,4), # create ordered factor 'polintr' and reverse order of factor levels using fct_rev() 
                                  labels = c("Very interested",
                                             "Quite interested",
                                             "Hardly interested",
                                             "Not at all interested")))) %>%
  mutate(gndr = factor(gndr, levels = c(1,2), labels = c("Male", "Female"))) %>%  # create binary factor 'gndr'
  mutate(domicil = factor(domicil, levels = c(1:5), labels = c("1","2","3","4","5"))) %>%  # create binary factor 'domicil'
  mutate(domicil = fct_collapse(domicil, Urban = c(1,2,3), Rural = c(4,5))) %>%  # collapse categories
  mutate(region = recode_factor(as.factor(region),  # create unordered factor 'region'
                                CH01 = "Lake Geneva",
                                CH02 = "Middleland",
                                CH03 = "North-West",
                                CH04 = "Zurich",
                                CH05 = "Eastern Part",
                                CH06 = "Central Part",
                                CH07 = "Ticino")) %>% 
  mutate(eisced = factor(eisced, ordered = TRUE, labels = c("ES-ISCED I",  # create ordered factor and name it 'educ'
                                                            "ES-ISCED II",
                                                            "ES-ISCED IIIb",
                                                            "ES-ISCED IIIa",
                                                            "ES-ISCED IV",
                                                            "ES-ISCED V1",
                                                            "ES-ISCED V2"))) %>% 
  rename(educ = eisced) %>% 
  mutate(age_group = factor(agea, ordered = TRUE, levels = c(18:90))) %>%  # create ordered factor 'age_group'
  mutate(age_group = fct_collapse(age_group, young = c(18:35), middle = c(36:55), older = c(56:90))) # collapse categories
  


# Step 4: Inspect the new data set ---- 

head(ess_1, 10)
str(ess_1) 
summary(ess_1)
View(ess_1)
 
