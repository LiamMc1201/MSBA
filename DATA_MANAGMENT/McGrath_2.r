## Load In Data

Census <- read.csv("https://s3.amazonaws.com/itao-30230/aff_2012.csv")

## increase the load timeout of the file to 5 minutes
options(timeout = 300)





##Load TidyVerse

library(tidyr)

library(dplyr)



##The analytic effort that you are supporting seeks to determine whether employees are paid differently in firms that are owned by men, by women, 
##or have ownership shared equally between men and women.  
##You wish to break out your analysis by county and industry.





## Remove row 1 in the census dataset because it is a repeat of column names


Census <- Census[-1,]


summary(Census)


## Create a county and a state column by separating the Geo.display-label column into two columns

Census <- separate(Census,col = 3, c("county", "state"), sep = ", ")


## Change the Naics.display.label column to sector

Census <- rename(Census, sector = 6)


## Delete Unused columns


## Delete the FIRMALL column (14) RCPALL column(15),FIRMNOPD column(20), RCPNOPD column(21), FIRMALL_S column(22),
## RCPALL_S column(23), FIRMNOPD_S column(24) and RCPNOPD_S column(25), They are not relevant to the analysis

Census <- select(Census, -c(14, 15, 20, 21, 22, 23, 24, 25))


##Convert columns 13:21 to numeric

Census[, 13:21] <- sapply(Census[, 13:21], as.numeric)


## Columns 15 & 17 should be rounded to the nearest whole dollar

Census$RCPPDEMP <- round(Census$RCPPDEMP, digits = 0)

Census$PAYANN <- round(Census$PAYANN, digits = 0)



##equal: the average salary paid by firms that have ownership split equally among men and women
##female: the average salary paid by firms that are owned primarily by women
##male: the average salary paid by firms that are owned primarily by men

## Create a dataframe called Census 2 that has County,State and Sector column from census

Census2 <- select(Census, 3, 4, 6)


## Remove columns 9:12 in the census dataset not relevant to the analysis

Census <- select(Census, -c(9:12))



##Pivot wider and drop off the columns that aren't male, female or equal on census

Census <- pivot_wider(Census, names_from = SEX.display.label, values_from = PAYANN)


## Change Female-owned name to Female in census


Census <- rename(Census, Female = 17)

Census <- rename(Census, Male = 18)

Census <- rename(Census, Equal = 19)



##Fixed Problems missing columns in Census_Final 

Census_Final5 <- select(Census, 3, 4, 6, 17, 18, 19)

## create a row that will concantenate the male,female and equal rows and call it check
Census_Final5$check <- paste(Census$Male, Census$Female, Census$Equal, sep = ",")

## If a row in column check is equal to "NULL,NULL,NULL" then remove the row

Census_Final5 <- filter(Census_Final5, check != "NULL,NULL,NULL")

Census_Final5 <- filter(Census_Final5, check != "NA,NULL,NULL")

Census_Final5 <- filter(Census_Final5, check != "NULL,NA,NULL")

Census_Final5 <- filter(Census_Final5, check != "NULL,NULL,NA")

##Noticed that different combinations of NA and NULL showed up so modified above to fit 

## Remove the check column

Census_Final5 <- select(Census_Final5, -c(7))


##Run Code Provided in HW 2
head(Census_Final5)

summary(Census_Final5)

dim(Census_Final5)


# Convert Census_Final5 to a data frame DOES NOT WORK IF NOT  
Census_Final5_df <- as.data.frame(Census_Final5)


##unlist the Male,Female and Equal columns in Census_Final5_df because it cannot be converted into a true dataframe without being unlisted

Census_Final5_df <- unlist(Census_Final5_df)

##Write to my desktop path because the one drive does not allow for R to write a CSV to it

write.csv(Census_Final5_df, "C:/Users/liamm/Desktop/DATA_MANAGMENT_Census.csv", na = "")

















































