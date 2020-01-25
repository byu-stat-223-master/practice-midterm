# Part 1 ----
tickets <- function() {
  all_tickets <- c("red", "blue", "green", "yellow")
  red_tickets <- 0
  total <- 0
  while (red_tickets < 5) {
    drawn_tickets <- sample(all_tickets, size = 3, replace = TRUE, prob = c(0.12, 0.25, 0.38, 0.26))
    red_tickets <- red_tickets + sum(drawn_tickets == "red")
    total <- total + 2.5
  }
  total
}

# Part 2 ----
n_reps <- 10000
results <- replicate(n_reps, tickets())

# Part 3 ----
(estimate <- mean(results))

# Part 4 ----
(estimate + c(lower = -1, estimate = 0, upper = 1) * qnorm(0.975) * sd(results) / sqrt(length(results)))
