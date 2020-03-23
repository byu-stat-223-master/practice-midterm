# Read data
library(tidyverse)
schedule <- read_csv(here::here("exams", "exam1", "jazz-schedule.csv"))

# Add win_pct column
schedule <- schedule %>% 
  mutate(win_pct = wins / (wins + losses))

# Optionally, create vector of opponent win percentage
opp_wp <- schedule$wins / (schedule$wins + schedule$losses)

# Part 1 ----
# Helper function
win_likelihood <- function(wpa, wpb) {
  wpa * (1 - wpb) / (wpa * (1 - wpb) + wpb * (1 - wpa))
}

# Option 1 using rbinom
jazz_wp <- 29 / (29 + 13)

jazz <- function(jazz_wp, opp_wp) {
  jazz_liklihood <- win_likelihood(jazz_wp, opp_wp)
  sum(rbinom(length(jazz_liklihood), 1, prob = jazz_liklihood))
}

# Option 2 using for loop and sample
jazz <- function(jazz_wp, opp_wp) {
  jazz_liklihood <- win_likelihood(jazz_wp, opp_wp)
  total_wins <- 0
  for (i in 1:length(jazz_liklihood)) {
    p <- jazz_liklihood[i]
    total_wins <- total_wins + sample(c(0, 1), size = 1, prob = c(1 - p, p))
  }
  total_wins
}

# Part 2 ----
n_reps <- 10000
season_results <- replicate(n_reps, jazz(jazz_wp, opp_wp))

# Part 3 ----
# Jazz currently have 29 wins, so to get to 60 they need 60 - 29 (31) wins the
# rest of the season
(est <- mean(season_results >= (60 - 29)))

# Part 4 ----
est + c(lower = -1, est = 0, upper = 1) * qnorm(0.975) * sqrt((est * (1 - est))/length(season_results))
