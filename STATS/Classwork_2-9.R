##Simulation Practice

number_plants <- 1000

number_days <- 65

for(i in 1:number_days){
  day <- i
  
  live_dead <- rbinom(n = number_plants, size = 1, 
                      prob = 0.999)
  
  daily_dead <- sum(live_dead == 0)
  
  number_plants <- number_plants - daily_dead
  
  number_plants
}

## How to use Replicate 

replicate(100, {
  number_plants <- 1000
  
  number_days <- 180
  for(i in 1:number_days){
    day <- i
    
    
    
    pump_failure <- rbinom(n = 1, 
                           size = 1, 
                           prob = 0.01)
    
    if(pump_failure == 1){
      
      
      live_dead <- rbinom(n = number_plants, 
                          size = 1, 
                          prob = 0.99)
      
      daily_dead <- sum(live_dead == 0)
      
      number_plants <- number_plants - daily_dead
      
      number_plants
    } else {
      
      live_dead <- rbinom(n = number_plants, 
                          size = 1, 
                          prob = 0.999)
      
      daily_dead <- sum(live_dead == 0)
      
      number_plants <- number_plants - daily_dead
      
      number_plants
    }
    
    
    
    
    View(results)
    
    
    
    lapply(list, function(run))(i in 1:1000){ 
      number_plants <- 1000
      
      number_days <- 65
      
      for(i in 1:number_days){
        day <- i
        
        live_dead <- rbinom(n = number_plants, size = 1, 
                            prob = 0.999)
        
        daily_dead <- sum(live_dead == 0)
        
        number_plants <- number_plants - daily_dead
        
        number_plants
      }
    }

    
results <- do.call(rbind, results)
    
    
    
    
    
    
    
    
    
    
    
    