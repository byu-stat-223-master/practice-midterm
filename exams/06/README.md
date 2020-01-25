
## Winnebago (65 points)

You visit Alabama to attend the Alabama vs LSU football game. The
football game kicks off at 2:30pm and your flight departs from the
Atlanta airport at 9:30pm. You’re trying to figure out what time you
should leave and head to the airport. The length of the game in minutes
is defined by a normal distribution with a mean of 180 and a standard
deviation of 15. If you choose to leave the game early, you leave 15
minutes before the end of the game. There are 3 different routes you can
possibly take to the airport. Each route is defined by the following
parameters:

Route 1 (freeway): This route is a few miles longer than the other
routes, but it’s almost all freeway driving. If there is no traffic,
this route takes 3 hours exactly. If you leave before the game is over,
the number of minutes added by traffic is defined by an exponential
distribution with a lambda (rate) parameter of 1. If you leave after the
game ends, the number of minutes added by traffic is defined by an
exponential distribution with a lambda (rate) parameter of .05.

Route 2 (backroads): This route avoids freeways and rarely experiences
traffic delays. However, the average speed limit on this route is lower
than the freeway. If there are no delays, this route takes 3 hours and
15 minutes. However, there are 23 traffic signals along this route.
There is an 15% chance of getting stopped at each light and, if you are
stopped, the waiting time at the light (in minutes) is defined by a
normal distribution with a mean of 2 and a standard deviation of 0.3.
Since this route involves several winding, back country roads that are a
single lane, there is a risk of getting stuck behind weekend travelers
out in their Winnebago. The likelihood of getting stuck behind such a
vehicle is 15%. If you get stuck behind a Winnebago, the route takes 30
minutes longer.

Route 3 (combination): This route is a combination of freeway and back
roads. With no delays, this route takes 3 hours and 10 minutes. If you
take this route before the game is over, the traffic delay is defined by
an exponential distribution with a lambda (rate) parameter of 3. If you
leave after the game is over, the traffic delay is defined by an
exponential distribution with a lambda (rate) parameter of 0.3. There
are only 10 traffic signals on this route, and the parameters related to
the traffic signals are the same as Route 2. There’s also a 15% chance
of getting stuck behind a Winnebago, which would add 20 minutes to the
route.

You anticipate a long security line at the airport. If you don’t arrive
at the airport at least an hour before the flight, you will miss the
flight.

Helpful hints:

  - The `rnorm` function can be used to generate random values from a
    normal distribution with a given `mean` and `sd`
  - The `rexp` function can be used to generate random values from an
    exponential distribution with a given `rate`

<!-- end list -->

1.  (35 points) Define a function called `winnebago` that simulates a
    single scenario. This function should take a single logical
    argument, `leave`, which indicates whether or not you leave the game
    early. This function should evaluate each route and return two
    pieces of information (you can decide how you want to return this
    information):
2.  The name of the route that was the fastest
3.  A logical value indicating whether you made it to the airport in
    time for your flight using the fastest route
4.  (10 points) Using the function defined in step 1, run this
    simulation 10,000 times for both scenarios (leaving early and
    staying the whole game) and store the results
5.  (10 points) Using the results from step 2, estimate the likelihood
    that you will make your flight under both scenarios (leaving early
    and staying the whole game)
6.  (5 points) Calculate a 95% confidence interval for the two estimates
    calculated in step 3.
7.  (5 points) Based on your simulation, should I plan to leave the game
    early or stay the entire game? Which route is the best route to get
    me to the airport on time?

## Tickets (40 points)

There is a box with a collection of 4 different types of tickets (red,
blue, green, and yellow). Each ticket allows you to play different
carnival games. Suppose you are only interested in playing games
supported by red tickets.

The probabilities of obtaining a red, blue, green, and yellow ticket are
respectively 0.12, 0.25, 0.38, 0.26 and the box has so many tickets that
the probabilities are unaffected as tickets are withdrawn.

You can purchase a random draw of 3 tickets for $2.50. You decide to
keep purchasing draws until you collect 5 red tickets.

1.  (25 points) Define a function called `tickets` that simulates a
    single scenario of purchasing random draws of 3 tickets until you
    have collected 5 red tickets. This function should return the amount
    of money you spent to obtain 5 red tickets.
2.  (5 points) Using the function defined in 1, run this simulation
    10,000 times and store the results.
3.  (5 points) Using the results from step 2, estimate the amount of
    money you would need to spend in order to obtain 5 red tickets.
4.  (5 points) Calculate a 95% confidence interval on the estimate from
    the previous step.
