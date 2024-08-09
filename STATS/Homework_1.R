LEVEL_UP <- read.csv("C:/Users/liamm/OneDrive - nd.edu/STATS/level_up_data.csv")
sample_LU <- sample(1:nrow(LEVEL_UP), .25 * nrow(LEVEL_UP))
sampled_LD <- LEVEL_UP[sample_LU, ]

install.packages(c("psych"))
installed.packages(hmisc)
library(Hmisc)

Hmisc::describe(sampled_LD)

library(psych)

