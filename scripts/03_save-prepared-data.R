# run code from script 1 and 2 
source(here::here("scripts", "02_data-preproc.R"))

# save prepared data
save(ess_1, here::here("data_prep", file = "ess_1.Rda"))