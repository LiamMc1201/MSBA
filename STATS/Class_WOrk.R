library(linprog)


pizza_optimizer <- function(pizza_cost) {
  c_vec <- c(3,1,1.5,1)
  b_vec <- c(2000,10)
  directions <- c(">=",">=")
  A_matrix <- rbind(c(285,100,168,200),
                    c(0,.5,2,3))
  diet_solution <- solveLP(c_vec,
                           A_matrix, 
                           b_vec,
                           max = FALSE,
                           directions)
  cbind(diet_solution$opt,
        t(diet_solution$solution))
}

lapply(runif(100,.25,3.5),pizza_optimizer)



