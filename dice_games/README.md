# Dice Games

We can roll dice whilst playing games. Here we are going to test 2 simple dice games and work out
how we can write the code to simulate rolling the dice in the different situations

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the exercise

To run the exercise, you just need to run:

```
$ rspec
```

The tests will (mostly), fail, but the output will contain

```
Finished in 0.01159 seconds (files took 0.05049 seconds to load)
32 examples, 31 failures
```

One of the tests already passes! But we still have another 31 tests to fix...

Now we need to fix the specs. There are 2 files inside the `lib/` directory that we need to edit.
These two files will tell us how to solve the following problems.

1. Roll any number of dice and observe their values
1. Play a game of greed, a single player dice scoring game (Rules you need to deduce from the spec)

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
