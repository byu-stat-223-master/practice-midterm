# Part 1 ----
winnebago <- function(leave = FALSE) {
  game_length <- rnorm(n = 1, mean = 180, sd = 15)
  if (leave) {
    # Route 1
    base_time <- 180  # Time in minutes with no traffic
    traffic_time <- rexp(n = 1, rate = 1)  # Minute delay due to traffic
    route_1 <- base_time + traffic_time - 15  # Total Route 1 time
    
    # Route 2
    base_time <- 195  # Time in minutes with no delays
    lights <- rbinom(n = 1, size = 23, prob = .15)  # Number of traffic lights
    light_time <- sum(rnorm(n = lights, mean = 2, sd = 0.3))  # Minutes waiting at traffic lights
    winnebago_time <- sample(x = c(0, 1), size = 1, prob = c(0.85, 0.15)) * 30  # Number of minutes due to Winnebago
    route_2 <- base_time + light_time + winnebago_time - 15  # Total Route 2 time
    
    # Route 3
    base_time <- 190  # Time in minutes with no delays
    traffic_time <- rexp(n = 1, rate = 3)  # Minute delay due to traffic
    lights <- rbinom(n = 1, size = 10, prob = .15)  # Number of traffic lights
    light_time <- sum(rnorm(n = lights, mean = 2, sd = 0.3))  # Minutes waiting at traffic lights
    winnebago_time <- sample(x = c(0, 1), size = 1, prob = c(0.85, 0.15)) * 20
    route_3 <- base_time + traffic_time + light_time + winnebago_time - 15
  } else {
    # Route 1
    base_time <- 180  # Time in minutes with no traffic
    traffic_time <- rexp(n = 1, rate = .05)  # Minute delay due to traffic
    route_1 <- base_time + traffic_time # Total Route 1 time
    
    # Route 2
    base_time <- 195  # Time in minutes with no delays
    lights <- rbinom(n = 1, size = 23, prob = .15)  # Number of traffic lights
    light_time <- sum(rnorm(n = lights, mean = 2, sd = 0.3))  # Minutes waiting at traffic lights
    winnebago_time <- sample(x = c(0, 1), size = 1, prob = c(0.85, 0.15)) * 30  # Number of minutes due to Winnebago
    route_2 <- base_time + light_time + winnebago_time  # Total Route 2 time
    
    # Route 3
    base_time <- 190  # Time in minutes with no delays
    traffic_time <- rexp(n = 1, rate = 0.3)  # Minute delay due to traffic
    lights <- rbinom(n = 1, size = 10, prob = .15)  # Number of traffic lights
    light_time <- sum(rnorm(n = lights, mean = 2, sd = 0.3))  # Minutes waiting at traffic lights
    winnebago_time <- sample(x = c(0, 1), size = 1, prob = c(0.85, 0.15)) * 20
    route_3 <- base_time + traffic_time + light_time + winnebago_time
  }
  
  routes <- c(
    "Route 1" = route_1,
    "Route 2" = route_2,
    "Route 3" = route_3
  ) + game_length
  
  best_route <- routes[which.min(routes)]
  
  6 * 60 - best_route > 0
  # best_route
}

# Part 2 ----
## Leaving early
n_reps <- 10000
leaving <- replicate(n_reps, winnebago(leave = TRUE))

## Staying entire game
staying <- replicate(n_reps, winnebago(leave = FALSE))

# Part 3 ----
## Leaving early
leaving_lh <- mean(leaving)

## Staying
staying_lh <- mean(staying)

# Part 4 ----
ci <- function(x) {
  estimate <- mean(x)
  estimate + c(lower = -1, estimate = 0, upper = 1) * qnorm(0.975) * sqrt(estimate * (1 - estimate) / length(x))
}

ci(leaving)
ci(staying)


# Part 5 ----
# You should plan to leave the game early. The best route is:
(best_route <- names(table(names(leaving))[which.max(table(names(leaving)))]))
