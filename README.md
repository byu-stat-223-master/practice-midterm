## Orchard (60 points)
For Christmas my daughters received the game [First
Orchard](https://www.habausa.com/my-very-first-games-first-orchard/){target="_blank"}.
The premise of the game is as follows:

* There is an orchard of 4 unique fruit trees, each of which has 4 pieces of
fruit (each tree contains only one type of fruit, so there are 4 different types
of fruit in the game)
* There is a raven trying to make it to the orchard before all the fruit is
harvested into a fruit basket

Each turn of the game, a player rolls a six sided die. Four of the sides of the
die correspond to the four different fruit trees in the orchard. One side of the
die shows a fruit basket, and the remaining side shows a raven. If a player
rolls a fruit, they select one fruit from that tree and place it in the fruit
basket. If the tree that was rolled doesn't have any fruit left, nothing happens
and the turn ends. If a player rolls the fruit basket, they choose a single
fruit from any tree and place it in the fruit basket. If a player rolls the
raven, the raven moves one step closer to the orchard.

The game ends when one of two things happen: Either all of the fruit is
harvested into the fruit basket **or** the raven reaches the orchard. The raven
must be rolled 6 times in order to each the orchard. If the raven reaches the
orchard before all the fruit is harvested, the game is considered lost.

Most of this game is luck based only on the roll of the die. However, there is
some small strategy involved when the fruit basket is rolled. We'll consider the
following two strategies:

* Highest: When the fruit basket is rolled, the player choose a fruit from the
tree with the most remaining fruits and places it in the fruit basket.
* Random: When the fruit basket is rolled, the player randomly selects one of
the remaining fruit and places it in the fruit basket.

1. Create a function called `orchard`. This function should take a single
argument `strategy` that is either `"random"` or `"highest"`, indicating which
of the above strategies will be used. The function should simulate playing the
game one time using the given strategy and return either `TRUE` or `FALSE` based
on whether or not the players won the game. In other words, if all the fruit is
harvested, the function should return `TRUE`. If the raven advances six spaces
before all the fruit is harvested the function should return `FALSE`. (20
points)
2. Using the `orchard` function from the previous step, simulate playing this
game with each strategy 10,000 times and store the results. (15 points)
3. Based on the results obtained in step 2, calculate an estimate for the
likelihood of winning (collecting all the fruit before the raven reaches the
orchard) for each strategy. (10 points)
4. Build a 95% confidence interval on the estimates you calculated in step 3.
(10 points)
5. Based on your estimates and associated confidence intervals, is one strategy
better than the other? Explain your reasoning. (5 points)

## Spin the Wheel (45 points)
You are at a carnival playing a "Spin the Wheel" type game. Eager to win a
stuffed rat, you wait over an hour in line to play. The rules of the game are as
follows:

* You pay 1 ticket to play
* You spin a fair spinner divided into 10 parts
* You keep spinning until you land on a number other than 1, 5, 7 or until
you've spun 50 times
* If the first spin results in number other than 1, 5, or 7, you lose and win
nothing
* If you land on a 1, 5, or 7 you win 5 tickets and spin again
* If the second spin results in a number other than 1, 5, or 7 you lose and take
your 5 tickets. Otherwise, you win $(5 * 2) + 1 = 11$ tickets. This pattern of
earnings up to spin 50 can be represented with the following equation:

![](https://latex.codecogs.com/gif.latex?%5Ctext%7Bearnings%7D%20%3D%205n%20&plus;%20%28n%20-%201%29%5Csubstack%7Bn%5C%2C%5Cin%5C%7B1%2C2%2C3%2C...%2C50%5C%7D%7D)

According to this formula, the maximum tickets you could earn would be 299. The
stuffed rat you have your eye on costs only 20 tickets. Using a simulation
study, determine the likelihood that you'll be able to afford the stuffed rat
after playing the game.

1. Create a function called `spinner`. This function should simulate playing
this carnival game 1 time and return the number of tickets you won. (15 points)
2. Using the function defined above, simulate the game 10,000 times and store
the results. (10 points)
3. Using the values calculated in step 2, calculate an estimate of the
likelihood that you win enough tickets to get the stuffed rat. (10 points)
4. Build a 95% confidence interval on the estimate you calculated. (10 points)

*Make sure that you follow proper coding standards. Pay particularly close
attention to code formatting (it should look nice) and don't duplicate code -
look to create functions whenever you can.*