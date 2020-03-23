
## Wildfire (60 points)

Australia is currently in the midst of the [worst wildfire season in
recent
memory](https://www.cnn.com/2020/01/01/australia/australia-fires-explainer-intl-hnk-scli/index.html).
At least two dozen people have been killed. Over 12 million acres of
land have been burned and an estimated 480 million animals have
died\[1\]. The impact has been catastrophic.

Fires are exceptionally difficult to predict. [Wildfire
modeling](https://en.wikipedia.org/wiki/Wildfire_modeling) is typically
based on simulation and is often complex and difficult. However, we can
create a simplified wildfire simulation with the following guidelines:

  - Start with a known number of trees burning
  - For each burning tree, there are a random number of trees (defined
    by a geometric distribution with `prob = 0.5`) within the “danger
    zone”
  - Each tree within the “danger zone” has a fixed probability of
    catching on fire
  - As each new tree catches fire, the cycle repeats

This process can be conceptually represented as a two step cycle: 1. How
many trees are currently in the “danger zone” 2. How many of the trees
in the “danger zone” actually catch fire. This number becomes the next
input for determining step 1.

Given this simplified approach, there are two possible simulation
outcomes: Either the fire dies out or it consumes the entire forest.

Helpful hints: \* You can draw random values from the geometric
distribution with the `rgeom()` function

1.  (35 points) Define a function called `wildfire` that simulates a
    single scenario. This function should take 3 arguments:

<!-- end list -->

  - `p`: the likelihood that a tree in the “danger zone” catches fire
  - `burning`: the number of trees initially burning
  - `total_trees`: the total number of trees in the forest  
    This function should return the total number of trees burned.

<!-- end list -->

2.  (10 points) Using the function defined in step 1, run this
    simulation 10,000 times each for the following two scenarios:

<!-- end list -->

  - Fire starts with 1 burning tree, `p = 0.9`, with 1,000 trees in the
    forest
  - Fire starts with 6 burning trees, `p = 0.4`, with 1,000 trees in the
    forest

<!-- end list -->

3.  (10 points) Using the results from step 2, estimate the average
    number of trees burned in each scenario.
4.  (5 points) Calculate a 95% confidence interval for the two estimates
    calculated in step 3.

## Utah Jazz (45 points)

The Utah Jazz are in the midst of an impressive season. At the time of
writing this question (2020-01-18) the Jazz have a 29-13 record (29
wins, 13 losses). This translates to a win percentage of .690 (29 / (29
+ 13)) The file `opponents.csv` contains Jazz opponents for the
remainder of the season and their current win-loss record. Please note
the in the course of a season, the Jazz play teams multiple times, so it
is expected to see teams repeated on the schedule.

Given a game between two opponents (referred to as A and B), the
likelihood that team A wins is defined as\[2\]:

\[
P_A = \frac{WP_A(1 - WP_B)}{WP_A(1 - WP_B) + WP_B(1 - WP_A)}
\]

Where \(P_A\) is the probability that team A wins, \(WP_A\) is the
winning percentage of team A, and \(WP_B\) is the winning percentage of
team B.

Using this equation, create a function that simulates the remainder of
the Jazz season by estimating the outcome of each remaining game. This
simulation should use the Jazz’s current win percentage as the Jazz’s
win percentage for every game (in other words, you don’t need to use the
previously simulated game to adjust the Jazz’s win percentage).

1.  (30 points) Define a function called `jazz` that simulates the
    remainder of the Jazz’s season. This function should return the
    total number of wins the Jazz have at the end of the season.
2.  (5 points) Using the function defined in 1, run this simulation
    10,000 times and store the results.
3.  (5 points) Using the results from step 2, estimate the likelihood
    that the Jazz win at least 60 games this season.
4.  (5 points) Calculate a 95% confidence interval on the estimate from
    the previous step.

<!-- end list -->

1.  [Using US map to examine scale of massive Australia
    wildfires](https://abcnews.go.com/International/us-map-examine-scale-massive-australia-wildfires/story?id=68102703)

2.  [Probabilities of Victory in Head-to-Head Team
    Matchups](https://sabr.org/research/probabilities-victory-head-head-team-matchups)
