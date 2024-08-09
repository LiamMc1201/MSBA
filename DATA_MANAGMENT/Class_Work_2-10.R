library(tidyverse)
library(readxl)

inspections <- read_csv("https://s3.amazonaws.com/itao-30230/inspections.csv")

names <- c('ID','DBAName','AKAName','License','FacilityType','Risk','Address','City','State',
           'Zip','InspectionDate','InspectionType',
           'Results','Violations','Latitude','Longitude','Location')


inspections <- read_csv("https://s3.amazonaws.com/itao-30230/inspections.csv", col_names = names,skip = 1)


summary(inspections)


inspections <- inspections %>%
  filter(Results == "Fail") %>%
  group_by(DBAName) %>%
  summarize(count=n()) %>%
  arrange(desc(count))



## Tab Separated Vales read 

inpatient <- read_tsv("https://s3.amazonaws.com/itao-30230/inpatient.tsv",col_names = names,skip = 1,col_types = types)


types <- c('ccccccccinnn')


names <- c('DRG','ProviderId','Name','Address','City','State','Zip','Region','Discharges',
          'AverageCharges','AverageTotalPayments','AverageMedicarePayments')


inpatient %>%
  group_by(DRG) %>%
  summarize(Discharges = sum(Discharges)) %>%
  arrange(desc(Discharges))


download.file("https://s3.amazonaws.com/itao-30230/breakfast.xlsx",'breakfast.xlsx')

breakfast <- read_excel('breakfast.xlsx',skip = 5,col_names = names)




library(tidyverse)


pew <- read_csv("https://s3.amazonaws.com/itao-30230/pew.csv")


colnames(pew)


colnames<-c('religion','under10','10-20','20-30','30-40','40-50','50-75','75-100','100-150','over150','refused')

                    

pew %>%
  pivot_longer(names_to = "income",values_to = "freq",cols != religion)





weather <- read_csv("https://s3.amazonaws.com/itao-30230/weather.csv")

summary(weather)



weather <- weather %>%
  mutate(station=as.factor(station), 
         element=as.factor(element))


summary(weather)


weather <- weather %>%
  filter(element != "PRCP")


colnames(weather) <- str_replace_all(colnames(weather),"d"," ")



weather %>%
  pivot_wider(names_from = element,values_from = value)
































