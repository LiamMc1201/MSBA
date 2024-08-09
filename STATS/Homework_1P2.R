LEVEL_UP <- read.csv("C:/Users/liamm/OneDrive - nd.edu/STATS/level_up_data.csv")

## Sampled data from level_up_data+
sample_LU <- sample(1:nrow(LEVEL_UP), .25 * nrow(LEVEL_UP))
sampled_LD <- LEVEL_UP[sample_LU, ]


library(Hmisc)


Hmisc::describe(sampled_LD)

View(sampled_LD)
names(sampled_LD)


#######################
##Correlation Tests####
#######################


##Correlation Between
cor.test(sampled_LD$performance, sampled_LD$currentSalary)
##After running Running this test and seeing that the p-value
## is close to 1 which means that there is a high possibility 
## that that this correlation can happen by chance which means 
## that the correlation is not statisically significant.


##Correlation Between
cor.test(sampled_LD$age, sampled_LD$currentSalary)
##After running Running this test and seeing that the p-value
## is close to 0 which means that there is a low possibility 
## that this correlation happens by chance which means that it is 
## statisically significant.


##Correlation Between
cor.test(sampled_LD$numberPriorJobs, sampled_LD$currentSalary)
##After running Running this test and seeing that the p-value is close to 0
## which means that there is a low possibility that this correlation happens
## by chance which means that it is statisically significant.


################
##Hypothesis####
################

#1# Based on the information found in each one of the correlation tests,
## It can be concluded that age and current salary have a positive correlation
## with each other. This means that as age increases, so does current salary.

#2# Based on the information found in the correlation test between the performance
## it showed that there wasn't a strong correlation between the two variables. This means that
## there is no correlation for how high the performance score is and how high the current salary is.



##################
##Visualizations##
##################

library(ggplot2)



ggplot(sampled_LD, aes(x = age, y = currentSalary)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + labs(title = "Age vs Current Salary", x = "Age", y = "Current Salary")

##given the scatter plot above, it shows that there is a positive correlation between age and current salary. Which proves
## the hypothesis that as age increases, so does current salary.



ggplot(sampled_LD, aes(x = performance, y = currentSalary)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + labs(title = "Performance vs Current Salary", x = "Performance", y = "Current Salary")

##given the scatter plot above, it shows that performance and current salary 
##have little to know correlation which proves the hypothesis that there is no correlation between
##performance and current salary.


#########
##Model##
#########

##Linear Regression Model on age and current salary
lm1 <- lm(currentSalary ~ age, data = sampled_LD)
summary(lm1)

##based on the linear regression model above, 
##it shows that there is a positive correlation between age and current salary
##which proves the hypothesis that as age increases, so does current salary.

##Linear Regression Model on performance and current salary
lm2 <- lm(currentSalary ~ performance, data = sampled_LD)
summary(lm2)
##based on the linear regression model above,
##it shows that there is no correlation between performance and current salary
##which proves the hypothesis that there is no correlation between performance and current salary.
  
library(sjPlot)

##linear regression model plot on age and current salary
plot_model(lm1, type = "pred", terms = c("age"))

##linear regression model plot on performance and current salary
plot_model(lm2, type = "pred", terms = c("performance"))

######################
##Extra for practice##
######################
install.packages("effects")
library(effects)

modeffects <- allEffects(lm1)

plot(modeffects, multiline = TRUE, rug = TRUE, x.var = "age", 
     main = "Age vs Current Salary")

