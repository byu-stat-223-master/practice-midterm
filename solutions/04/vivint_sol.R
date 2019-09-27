## Part 1 ----
### Solution 1
dbc <- function(n_techs = 150, l1 = 7, l2 = 3, l3 = 10, replacement_rate = 0.03, dbc_rate = 0.78, cancel_rate = 0.13) {
  # Weekday appointments
  wd_available_techs <- n_techs - rpois(5, l3)
  wd_appointments <- sum(sapply(wd_available_techs, function(n) sum(rpois(n, l1))))
  
  # Weekend appointments
  we_available_techs <- n_techs - rpois(2, l3)
  we_appointments <- sum(sapply(we_available_techs, function(n) sum(rpois(n, l2))))
  
  # Total appointments
  total_appointments <- wd_appointments + we_appointments
  
  # Find total number of doorbell replacements that would be needed
  ceiling(total_appointments * (1 - cancel_rate) * dbc_rate * replacement_rate)
}

### Solution 2
dbc <- function(n_techs = 150, l1 = 7, l2 = 3, l3 = 10, replacement_rate = 0.03, dbc_rate = 0.78, cancel_rate = 0.13) {
  # Weekday appointments
  wd_available_techs <- n_techs - rpois(5, l3)
  wd_appointments <- sum(sapply(wd_available_techs, function(n) sum(rpois(n, l1))))
  
  # Weekend appointments
  we_available_techs <- n_techs - rpois(2, l3)
  we_appointments <- sum(sapply(we_available_techs, function(n) sum(rpois(n, l2))))
  
  # Total appointments
  total_appointments <- wd_appointments + we_appointments
  
  # Find total number of doorbell replacements that would be needed
  rbinom(1, total_appointments, (1 - cancel_rate) * dbc_rate * replacement_rate)
}


## Part 2 ----
n_reps <- 10000
results <- replicate(n_reps, dbc())

## Part 3 ----
est_dbc <- mean(results)

## Part 4 ----
ci <- function(x, alpha = 0.05) {
  n <- length(x)
  x_bar <- mean(x)
  sd_x <- sd(x)
  ci <- x_bar + c(-1, 1) * qnorm(1 - (alpha / 2)) * sd_x / sqrt(n)
  c(
    lower = ci[1],
    est = x_bar,
    upper = ci[2]
  )
}
ci(results)

## Part 5 ----
ci(replicate(n_reps, dbc(n_techs = 160)))
