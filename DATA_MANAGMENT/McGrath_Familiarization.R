
library(tidyverse)

ggplot(data=ChickWeight) +
  geom_smooth(mapping=aes(x=Time, y=weight, color=Diet))


                     
                     