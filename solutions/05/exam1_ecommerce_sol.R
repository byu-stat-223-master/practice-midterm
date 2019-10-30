# Part 1 ----
## Option 1
website <- function(f, p) {
  # Number of days
  n_days <- 30
  # Targeted parameters
  t_lambda <- 1.75
  t_alpha <- 5
  t_beta <- 4
  # Casual parameters
  c_lambda <- 0.3
  c_alpha <- 1
  c_beta <- 25
  
  # Calculate revenue for each day
  revenue <- replicate(30, {
    # Number of visitors that day
    n <- f()
    
    # Number of targeted shoppers that day
    targeted <- ceiling(p * n)
    
    # Number of casual browsers that day
    casual <- n - targeted
    
    # Targeted revenue
    t_revenue <- sum(rexp(targeted, t_lambda) * rbeta(targeted, t_alpha, t_beta))
    
    # Casual revenue
    c_revenue <- sum(rexp(casual, c_lambda) * rbeta(casual, c_alpha, c_beta))
    
    t_revenue + c_revenue
  })
  
  sum(revenue)
}

## Option 2
website <- function(f, p) {
  # Number of days
  n_days <- 30
  # Targeted parameters
  t_lambda <- 1.75
  t_alpha <- 5
  t_beta <- 4
  # Casual parameters
  c_lambda <- 0.3
  c_alpha <- 1
  c_beta <- 25
  
  # Calculate revenue for each day
  revenue <- replicate(30, {
    # Number of visitors that day
    n <- rpois(1, f)
    
    # Number of targeted shoppers that day
    targeted <- ceiling(p * n)
    
    # Number of casual browsers that day
    casual <- n - targeted
    
    # Targeted revenue
    t_revenue <- sum(rexp(targeted, t_lambda) * rbeta(targeted, t_alpha, t_beta))
    
    # Casual revenue
    c_revenue <- sum(rexp(casual, c_lambda) * rbeta(casual, c_alpha, c_beta))
    
    t_revenue + c_revenue
  })
  
  sum(revenue)
}

# Part 2 ----
n_reps <- 1000
current_results <- replicate(n_reps, website(function() rpois(1, 10000), 0.3))

# Part 3 ----
campaign_results <- replicate(n_reps, website(function() rpois(1, 8000), 0.5))

# Part 4 ----
ci <- function(x, alpha = 0.05) {
  x_bar <- mean(x)
  sd_x <- sd(x)
  sqrt_n <- sqrt(length(x))
  
  ci <- x_bar + c(-1, 1) * qnorm(1 - alpha/2) * sd_x / sqrt_n
  c(
    lower = ci[1],
    estimate = x_bar,
    upper = ci[2]
  )
}

ci(current_results)
ci(campaign_results)

# Part 5 ----
# The campaign does not effectively increase site revenue