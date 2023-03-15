## Regression Analysis

# Step 1: Load packages
library(stargazer)  # Displays the regression results in a nice table
library(mfx)  # calculates the marginal effects


# Step 2: Set contrasts to handle ordered factors in the regression 
options(contrasts = c("contr.treatment", "contr.treatment"))


# Step 3: Run a logit regression 
logitmodel <- glm(vote ~ age_group + polintr + gndr + eduyrs + region, 
                  family = binomial(link = "logit"), data = ess_1)


# Step 4: Display the regression results 
stargazer(logitmodel, type = 'text')


# Step 5: Calculate the marginal effects for the logit regression 
mfx <- logitmfx(logitmodel, atmean = TRUE, data = ess_1)
mfx