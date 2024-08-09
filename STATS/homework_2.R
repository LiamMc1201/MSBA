##################
### Homework 2 ###
##################


## Task 1 ##

# You will be using the teamPerc.RData for this assignment. 
# It is an RData file, so you will use the load function to bring it in:
# load("/Users/sethberry/Downloads/teamPerc.RData")
# Notice that I don't assign it a name, just run it (with your own path) 
# and you'll see an object called "teamPerc" in your environment. 

## Task 2 ##

# The first column, "Rater", denotes if a leader or subordinate is
# offering the ratings. You can probably figure out which value
# is the "boss" and which represents the "subordinate". Perform
# a basic model to see if leaders assess effectiveness ("effect") 
# differently than subordinates. Tell me what you found. 

## Task 3 ##

# What do subordinates want out of their leaders? Variables 73 
# through 88 (takesCharge to operational) all deal with characteristics
# of leaders (you can probably imagine what they mean). 
# Use those variables as predictors for effectiveness. 

## Task 4 ##

# Pick one of those variables that look "strong" and interact 
# it with either "leader_tenure", "leader_age", "leader_female", 
# or "leader_experience". Plot your results and tell me what you
# think it means. 

## Task 5 ##

## Solve this problem

# Maximize: 40_oil + 7.5_flower
# Subject to: 
# requirement = 30_oil + 3_flower <= 8960
# oil, flower >= 0

library(linprog)

objectiveFunction  

constraintValues

constraintMatrix

linprog::solveLP()


# What is the projected revenue for this solution and 
# how much of each product needs to be made?