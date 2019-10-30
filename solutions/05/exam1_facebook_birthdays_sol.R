# Part 1 ----
facebook_bday <- function(n) {
  # Sample n from 1:365 with replacement
  birthdays <- sample(365, n, replace = TRUE)
  
  # Check to see if there are 365 unique values in birthdays
  length(unique(birthdays)) == 365
}

# Part 2 ----
n_reps <- 1000
results <- replicate(n_reps, facebook_bday(2000))

# Part 3 ----
est <- mean(results)

# Part 4 ----
ci <- est + c(-1, 1) * qnorm(0.975) * sqrt(est * (1 - est) / length(results))

# Bonus ----
n <- 2000
sim_results <- data.frame()
while (ci[1] < 0.75) {
  results <- replicate(n_reps, facebook_bday(n))
  est <- mean(results)
  ci <- est + c(-1, 1) * qnorm(0.975) * sqrt(est * (1 - est) / length(results))
  sim_results<- rbind(sim_results, c(n, ci, est))
  n <- n + 50
}
names(sim_results) <- c("n", "lower", "upper", "estimate")

sim_results
tail(sim_results, 1)

plot(
  sim_results$n,
  sim_results$estimate,
  type = 'l',
  xlab = "N FB Friends",
  ylab = "P"
)
lines(sim_results$n, sim_results$lower, type = 'l', lty = 2)
lines(sim_results$n, sim_results$upper, type = 'l', lty = 2)


library(ggplot2)
ggplot(sim_results, aes(x = n, y = estimate)) +
  geom_ribbon(aes(ymin = lower, ymax = upper), fill = "red", alpha = .2) +
  geom_line() +
  labs(
    x = "N FB Friends",
    y = "P"
  ) +
  theme_bw()
  
  
