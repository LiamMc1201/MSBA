library(tidyverse)

##Upload data
vehicles <- read_csv("https://s3.amazonaws.com/itao-30230/vehicles.csv",
                     col_types="inincicccici")

##mutate columns
vehicles <- vehicles %>%
  mutate(class=as.factor(class), drive=as.factor(drive), make=as.factor(make),
         transmissiontype=as.factor(transmissiontype))


##Problem 1 - Guided Visualization
##In this part of the assignment, you will generate five graphs from this dataset meeting the provided requirements.  
##You should be able to build these visualizations without using the dplyr library.

##Part A
##Generate a scatterplot showing the miles per gallon that the vehicle experiences during city driving on 
##the x-axis and the vehicle’s CO2 emissions on the y-axis.

## column names are make,model and co2emissions and citympg

ggplot(vehicles, aes(x=citympg, y=co2emissions)) +
  geom_point() +
  labs(title="CO2 Emissions vs City MPG",
       x="City MPG",
       y="CO2 Emissions")


##Part B
##Create a second scatterplot showing the same information as the plot from Part A but use color to distinguish vehicles by drive type.

ggplot(vehicles, aes(x=citympg, y=co2emissions, color=drive)) +
  geom_point() +
  labs(title="CO2 Emissions vs City MPG by Drive Type",
       x="City MPG",
       y="CO2 Emissions")


##Part C
##Create a stacked bar chart that shows the number of vehicles tested each year broken out by vehicle class.


ggplot(vehicles, aes(x=year, fill=class)) +
  geom_bar() +
  labs(title="Number of Vehicles Tested by Year",
       x="Year",
       y="Number of Vehicles")


##Part D
##Create a set of histograms that shows the number of vehicles tested by their mileage per gallon during city driving.  
##You should use one call to ggplot that creates separate histograms for each transmission type.


ggplot(vehicles, aes(x=citympg)) +
  geom_histogram(binwidth=5) +
  facet_wrap(~transmissiontype) +
  labs(title="Number of Vehicles Tested by City MPG",
       x="City MPG",
       y="Number of Vehicles")


##Problem 2 - Working with dplyr
##In this part of the assignment, you will expand your work to use the dplyr grammar of data manipulation.


##For each part below, use a single R statement to perform the task.  
##You may do this by joining together dplyr verbs and the ggplot commands with %>% and +.


##Part A
##Print a table showing the minimum, maximum, mean, and median city MPG for vehicles tested, broken out by vehicle class.  
##All values should be displayed as rounded to the nearest integer.  Use the as.integer() and round() functions, as necessary.

vehicles %>%
  group_by(class) %>%
  summarize(min=as.integer(round(min(citympg))),
            max=as.integer(round(max(citympg))),
            mean=as.integer(round(mean(citympg))),
            median=as.integer(round(median(citympg))))


##Part B
##Display a line graph showing the change in average city vs. highway MPG over time.  
##Do not round the data to integers this time.  Show the city MPG as a red line and the highway MPG as a blue line.

vehicles %>%
  group_by(year) %>%
  summarize(citympg=mean(citympg), highwaympg=mean(highwaympg)) %>%
  gather(key="type", value="mpg", -year) %>%
  ggplot(aes(x=year, y=mpg, color=type)) +
  geom_line() +
  labs(title="Average City vs Highway MPG Over Time",
       x="Year",
       y="Average MPG")




##Part C
##Modify the graph above to also show the overall MPG, computed as the average of city and highway MPG.  Plot this as a green line.

vehicles %>%
  group_by(year) %>%
  summarize(citympg=mean(citympg), highwaympg=mean(highwaympg)) %>%
  mutate(overallmpg=(citympg+highwaympg)/2) %>%
  gather(key="type", value="mpg", -year) %>%
  ggplot(aes(x=year, y=mpg, color=type)) +
  geom_line() +
  labs(title="Average City vs Highway MPG Over Time",
       x="Year",
       y="Average MPG")



##Part D
##Modify the graph above to show separate graphs for each drive type.

vehicles %>%
  group_by(year, drive) %>%
  summarize(citympg=mean(citympg), highwaympg=mean(highwaympg)) %>%
  mutate(overallmpg=(citympg+highwaympg)/2) %>%
  gather(key="type", value="mpg", -year, -drive) %>%
  ggplot(aes(x=year, y=mpg, color=type)) +
  geom_line() +
  facet_wrap(~drive) +
  labs(title="Average City vs Highway MPG Over Time by Drive Type",
       x="Year",
       y="Average MPG")




##Problem 3 - Data Exploration and Visualization
##Use the strategies you learned in class as well as your own independent research 
##to explore the vehicle testing and college datasets in more detail. 

##Create two interesting visualizations based upon your exploration.Take the time to beautify them.  
##Your grade for this portion of the assignment will be based upon your technical ability to create the visualizations,
##their analytical uniqueness, and their appearance.  Feel free to use the techniques that we explored in class and/or to explore other features of ggplot2.

##For each of your visualizations, provide a brief description of the insight that they provide.
##You should answer the question (with just a sentence or two), “What do we learn from this visualization?”  
##You can provide your answer as comments in your code or, if you would like to explore a new technology, try using RMarkdown.

##You may choose to use data from the vehicle dataset, the college dataset, or both.

College <- read_csv("https://s3.amazonaws.com/itao-30230/college.csv")




##visualization1


vehicles %>%
  ggplot(aes(x=cylinders, y=co2emissions, color=drive)) +
  geom_point() +
  labs(title="Cylinders vs CO2 Emissions by Drive Type",
       x="Cylinders",
       y="CO2 Emissions")


##from the visualization it is clear to see that as the number of clinders in a car 
##increases the amount of co2 emissions also increases
## with this insight it is clear that in order to decrease the amount of co2 emissions
## we need to decrease the number of cylinders in a car



##visualization2


vehicles %>%
  ggplot(aes(x=class, y=highwaympg, color=class)) +
  geom_boxplot() +
  labs(title="Highway MPG by Class",
       x="Class",
       y="Highway MPG")


##the cars that have the highest highway mpg are the two seaters 
##this is a helpuful insight for those who are looking to buy a car that
##has a high mpg on the highway such as comuters







