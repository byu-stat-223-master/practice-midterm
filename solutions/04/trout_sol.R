## Part 1 ----
trout <- function() {
  n_outs <- 0
  max_outs <- 27
  n_hr <- 0
  while (n_outs < max_outs) {
    ifelse(rbinom(1, 1, 0.54), n_outs <- n_outs + 1, n_hr <- n_hr + rbinom(1, 1, .15))
  }
  n_hr
}

## Part 2 ----
n_reps <- 10000
results <- replicate(n_reps, trout())

## Part 3 ----
expected_hr <- mean(results)

## Part 4 ----
ci <- expected_hr + c(-1, 1) * qnorm(0.975) * sd(results) / sqrt(length(results))

c(
  lower = ci[1],
  expected_hr = expected_hr,
  upper = ci[2]
)

## Part 5 ----
likelihood <- mean(results == 0)
ci <- likelihood + c(-1, 1) * qnorm(0.975) * sqrt(likelihood * (1 - likelihood) / length(results))
c(
  lower = ci[1],
  likelihood = likelihood,
  upper = ci[2]
)
