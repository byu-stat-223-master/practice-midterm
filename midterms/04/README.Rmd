## Mike Trout (45 points)
In 2018, Mike Trout (the best baseball player in MLB) had an On Base percentage
of .460, meaning that he made an out 54 percent of the time. In this
hypothetical simulation, Mike Trout is able to bat over and over again. When
Mike Trout doesn't make an out, he hits a home run 15 percent of the time. Once
Mike Trout makes 27 outs, a game is over.

1. Write a function that simulates a game and returns the amount of home runs
Mike Trout will hit in that game. (10 points)

2. Using the function you've written, simulate 10,000 games and store the
results. (10 points)

3. Using the results from step 2, what is the expected number of home runs Mike
Trout hits in this scenario? (5 points)

4. Calculate a 95% confidence interval on your results from step 3. (5 points)

5. You attend one of these hypothetical games, and Mike Trout doesn't hit a
single home run. Based on your simulation, what is the likelihood that this
happens (be sure to assess Monte Carlo error in your answer)? (15 points)

## Vivint (60 points)
You work as a member of the Business Analytics team at Vivint. You've been asked
to help with a supply chain problem. Vivint knows that doorbell cameras need to
be replaced 3% of the time and that 78% of Vivint customers own doorbell
cameras.

Each day, Vivint field technicians are out working with customers to repair and
replace equipment. The number of appointments a field technician makes on a
weekday is modeled by a Poisson distribution with $\lambda = 7$. The number of
appointments on the weekend is modeled after a Poisson distribution with
$\lambda = 3$. It is known that 13% of appointments are either cancelled the day
of or the customer simply isn't there for the appointment (a no show).

There are 150 total technicians in the field. However, on any given day, the
number of technicians that either take time off or call in sick is modeled by a
Poisson distribution with $\lambda = 10$.

Your task is to provide a reliable estimate of the total number of doorbell
cameras that need to be ordered each week in order to provide the technicians
with the appropriate number of cameras.

*Note, you can draw values from a Poisson distribution in R with the `rpois()`
function.*

1. Write a function that simulates a single week and returns the number of
doorbell cameras that are needed. (25 points)

2. Using the function you've written, simulate 10,000 weeks and store the
results. (10 points)

3. Using the results from the previous step, calculate an estimate for the
number of doorbell cameras needed each week. (5 points)

4. Calculate a 95% confidence interval on your results from step 3. (5 points)

5. The field support team is considering hiring an additional 10 technicians.
How does this impact the number of doorbell cameras that need to be ordered each
week? (15 points)
