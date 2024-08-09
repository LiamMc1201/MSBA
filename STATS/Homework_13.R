LEVEL_UP <- read.csv("C:/Users/liamm/OneDrive - nd.edu/STATS/level_up_data.csv")

## Sampled data from level_up_data+
sample_LU <- sample(1:nrow(LEVEL_UP), .25 * nrow(LEVEL_UP))
sampled_LD <- LEVEL_UP[sample_LU, ]


library(Hmisc)

Hmisc::describe()




#######################
##Correlation Tests####
#######################


##Correlation Between
cor(sampled_LD$performanceScore, sampled_LD$gender)


##Correlation Between
cor(sampled_LD$performanceScore, sampled_LD$currentSalary)


##Correlation Between
cor(sampled_LD$performanceScore, sampled_LD$age)


################
##Hypothesis####
################









