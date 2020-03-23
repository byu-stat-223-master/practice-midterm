## Part 1 ----
# Option 1 using rbinom
wildfire <- function(p, burning = 1, total_trees = 1000) {
  total_burned <- burning
  while (burning != 0 & total_burned < total_trees) {
    # How many trees are in the danger zone?
    danger_zone <- sum(rgeom(burning, 0.5))
    # How many of those in the danger zone are burning?
    burning <- rbinom(1, danger_zone, p)
    total_burned <- total_burned + burning
  }
  total_burned
}

# Option 2 using sample
wildfire <- function(p, burning = 1, total_trees = 1000) {
  total_burned <- burning
  while (burning != 0 & total_burned < total_trees) {
    # How many trees are in the danger zone?
    danger_zone <- sum(rgeom(burning, 0.5))
    # How many of those in the danger zone are burning?
    burning <- sum(sample(c(0, 1), danger_zone, prob = c(1 - p, p), replace = TRUE))
    total_burned <- total_burned + burning
  }
  total_burned
}

## Part 2 ----
n_reps <- 10000
fire_1 <- replicate(n_reps, wildfire(0.9, 1, 1000))
fire_2 <- replicate(n_reps, wildfire(0.4, 6, 1000))

## Part 3 ----
(fire_1_est <- mean(fire_1))
(fire_2_est <- mean(fire_2))

## Part 4 ----
ci <- function(v, alpha = 0.05) {
  est <- mean(v)
  est + c(lower = -1, est = 0, upper = 1) * qnorm(1 - alpha/2) * sd(v) / sqrt(length(v))
}

ci(fire_1)
ci(fire_2)
