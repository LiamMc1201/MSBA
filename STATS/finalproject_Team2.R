data <- read.csv("C:/Users/liamm/Downloads/marketing (1).csv")

View(data)

names(data)

#Products = Wine, Fruit, Meat Products, 
#Fish Products, Sweet Products, Gold Products

#FamilyPersonalVariables= Income, Kidhome, Teenhome, 
#marital status, education, age

#BuyingHabits = NumDealsPurchases, NumWebPurchases, NumCatalogPurchases,
#NumStorePurchases, NumWebVisitsMonth, Complain, Customer_Daays
#MntTotal, MntRegularProds, CMP - marketing, Complain

#We combined Kidhome with Teenhome to create the kids variable which 
#is essentially kids at home not paying for their own groceries.

kids <- data$Kidhome + data$Teenhome

#For the model, we are looking at the linear regression of total
#goods ordered with income and kids (interacting with each other).

model1 <- lm(MntTotal ~ Income*kids, data = data)

summary(model1)

library(sjPlot)

plot_model(model1, type = "int", mdrt.values = "meansd")

model2 <- lm(MntWines ~ Income*kids, data = data)

summary(model2)

plot_model(model2, type = "int", mdrt.values = "meansd")

model3 <- lm(MntMeatProducts ~ Income*kids, data = data)

summary(model3)

plot_model(model3, type = "int", mdrt.values = "meansd") 

model4 <- lm(MntGoldProds ~ Income*kids, data = data)

summary(model4)

plot_model(model4, type = "int", mdrt.values = "meansd")

model5 <- lm(MntFishProducts ~ Income*kids, data = data)

summary(model5)

plot_model(model5, type = "int", mdrt.values = "meansd")

model6 <- lm(MntSweetProducts ~ Income*kids, data = data)

summary(model6)

plot_model(model6, type = "int", mdrt.values = "meansd") 

model7 <- lm(MntRegularProds ~ Income*kids, data=data)

summary(model7)

plot_model(model7, type = "int", mdrt.values = "meansd") 

model8 <- lm(MntFruits ~ Income*kids, data=data)

summary(model8)

plot_model(model8, type = "int", mdrt.values = "meansd")

library(linprog)

c_vector <- c(meat = 5, wine = 15, fruit = 4)

b_vector <- c(budget = 200, mean = 5, wine = 3, fruit = 3)

constraint_ineq <- c(rep(">=", 4))
                     
A_matrix <- rbind(c(5,14,4),
                  c(1,0,0),
                  c(0,1,0),
                  c(0,0,1))
solveLP(c_vector,b_vector,A_matrix,maximum=FALSE,
        const.dir=constraint_ineq)

library(ROI)

library(ROI.plugin.glpk)

library(magrittr)

linear_constraints <- L_constraint(A_matrix, constraint_ineq,
                                    b_vector)

OP(c_vector, linear_constraints,types=rep("I",3),
   maximum=FALSE) %>% 
  ROI_solve() %>% 
  solution()

##simulation of the data

sim_data <- data.frame(Income = rnorm(100, mean = mean(data$Income), 
                                      sd = sd(data$Income)),
                       kids = rbinom(100, size = 1, prob = 0.5))

sim_data$MntWines <- predict(model2, newdata = sim_data)

sim_data$MntMeatProducts <- predict(model3, newdata = sim_data)

sim_data$MntFruits <- predict(model8, newdata = sim_data)

sim_data$MntFishProducts <- predict(model5, newdata = sim_data)

sim_data$MntSweetProducts <- predict(model6, newdata = sim_data)

sim_data$MntGoldProds <- predict(model4, newdata = sim_data)

sim_data

##plot the data separtatley sidebyside

library(ggplot2)

ggplot(sim_data, aes(x = Income, y = MntWines)) +
  geom_point() +
  labs(title = "Income vs MntWines",
       x = "Income",
       y = "MntWines")

ggplot(sim_data, aes(x = Income, y = MntMeatProducts)) +
  geom_point() +
  labs(title = "Income vs MntMeatProducts",
       x = "Income",
       y = "MntMeatProducts")

ggplot(sim_data, aes(x = Income, y = MntFruits)) +
  geom_point() +
  labs(title = "Income vs MntFruits",
       x = "Income",
       y = "MntFruits")

ggplot(sim_data, aes(x = Income, y = MntFishProducts)) +
  geom_point() +
  labs(title = "Income vs MntFishProducts",
       x = "Income",
       y = "MntFishProducts")

ggplot(sim_data, aes(x = Income, y = MntSweetProducts)) +
  geom_point() +
  labs(title = "Income vs MntSweetProducts",
       x = "Income",
       y = "MntSweetProducts")

ggplot(sim_data, aes(x = Income, y = MntGoldProds)) +
  geom_point() +
  labs(title = "Income vs MntGoldProds",
       x = "Income",
       y = "MntGoldProds")



ggplot(sim_data, aes(x = Income)) +
  geom_smooth(aes(y = MntWines, color = "Wines")) +
  geom_smooth(aes(y = MntMeatProducts, color = "MeatProducts")) +
  geom_smooth(aes(y = MntFruits, color = "Fruits")) +
  geom_smooth(aes(y = MntFishProducts, color = "FishProducts")) +
  geom_smooth(aes(y = MntSweetProducts, color = "SweetProducts")) +
  labs(title = "Simulation of 100 new customers",
       x = "Income",
       y = "MntWines, MntMeatProducts, MntFruits, MntFishProducts, MntSweetProducts, MntGoldProds") + theme_minimal() +
  scale_color_manual(values = c("red", "blue", "green", "yellow", "purple")) +
  theme(axis.title.y = element_blank())


## Kids

sim_data2 <- data.frame(Income = rnorm(100, mean = mean(data$Income), 
                                      sd = sd(data$Income)),
                       kids = rbinom(100, size = 3, prob = .5))

sim_data2$MntWines <- predict(model2, newdata = sim_data2)

sim_data2$MntMeatProducts <- predict(model3, newdata = sim_data2)

sim_data2$MntFruits <- predict(model8, newdata = sim_data2)

sim_data2$MntFishProducts <- predict(model5, newdata = sim_data2)

sim_data2$MntSweetProducts <- predict(model6, newdata = sim_data2)

sim_data2$MntGoldProds <- predict(model4, newdata = sim_data2)

sim_data2


ggplot(sim_data2, aes(x = kids)) +
  geom_smooth(aes(y = MntWines, color = "Wines")) +
  geom_smooth(aes(y = MntMeatProducts, color = "MeatProducts")) +
  geom_smooth(aes(y = MntFruits, color = "Fruits")) +
  geom_smooth(aes(y = MntFishProducts, color = "FishProducts")) +
  geom_smooth(aes(y = MntSweetProducts, color = "SweetProducts")) +
  labs(title = "Simulation of 100 new customers",
       x = "kids",
       y = "MntWines, MntMeatProducts, MntFruits, MntFishProducts, MntSweetProducts, MntGoldProds") + theme_minimal() +
  scale_color_manual(values = c("red", "blue", "green", "yellow", "purple")) +
  theme(axis.title.y = element_blank())




