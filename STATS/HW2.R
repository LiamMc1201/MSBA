##Task 1
load("C:/Users/liamm/OneDrive - nd.edu/STATS/teamPerc.RData")

View(teamPerc)


names(teamPerc)


##Task 2
basic_mod <- lm(
  effect ~ Rater,
  data = teamPerc
)

summary(basic_mod)

library(ggplot2)

ggplot(teamPerc, aes(x = Rater, y = effect)) +
  geom_boxplot() +
  geom_jitter(width = 0.2, height = 0)

## From running the plot and the summary it is clear that 
## the rater that is the leader(3) rates themselves as much higher 
## in terms of effectiveness vs when the subordinate(0) rates the effectiveness in the leader
## this is a clear bias and is not a good way to measure the effectiveness of a leader.



##Task 3
var_names <- names(teamPerc)

data.frame(var_names,
           1:length(var_names))

row_mod <- teamPerc[,c(50, 73:88)]


leaders_mod <- lm(
  effect ~ .,
  data = row_mod
)

summary(basic_mod)

library(sjPlot)

plot_model(leaders_mod)

## this model is extremely interesting because of the fact that it shows that forcefulness and 
## listens is the are the most important factors in determining the effectiveness of a leader
## since these are very opposite leadership tactics it is interesting to see that they are the most important.


## task 4


interactions_mod <- lm(
  effect ~ leader_tenure * forceful,
  data = teamPerc
)

plot_model(interactions_mod)
  
## In this model what immediately jumps out is the forceful is a negative impact on 
## the effectiveness of a leader. When it comes to when leader tenure and forceful has 
## seemingly no impact on the effectiveness of a leader. This is interesting because it
## shows in the leaders_mod model that forceful is the most important factor in determining
## the effectiveness of a leader. This is a very interesting contradiction and is worth looking into further.

## task 5

## Solve this problem

# Maximize: 40_oil + 7.5_flower
# Subject to: 
# requirement = 30_oil + 3_flower <= 8960
# oil, flower >= 0



library(linprog)

#defining parameters 
obj <- c(40, 7.5)
const.mat <- matrix(c(30, 3), nrow = 1)
const.dir <- c("<=")
const.rhs <- 8960

#solving model

lp.solution <- lp("max", obj, const.mat, const.dir, const.rhs, compute.sens = TRUE)

lp.solution$solution

lp.solution$objective

## I had some issues with the LpSolve package and couldn't find many examples online
## I did find the lp.solution method and thought it was an interesting way to solve the problem
## (I do not know if it was solved correctly)

##Revenue 2986.66

## 40 oil and 7.5 flower is the optimal solution to maximize revenue

## I see that this solution is not the most optimized because of the fact that it zero'd out 
## the most expensive resource. I tried varies methods to get a different solution but all 
## had errors


