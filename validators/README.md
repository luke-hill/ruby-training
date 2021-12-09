# Validators

Occasionally we will want to check an input to a method. So here we are going to build a set of
simple validators, that will check certain inputs and output how they conform.

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

By now you should know that to start with all of the examples will fail! The output should contain (near the bottom)

```
Finished in 0.01969 seconds (files took 0.09907 seconds to load)
13 examples, 13 failures
```

Now we need to fix the specs. There are 2 files inside the `lib/` directory that we need to edit.
These two files will tell us how to solve the following problems.

1. Validate whether a single letter input is ...
   * Either a vowel or a consonant
   * Is in the first half of the alphabet or the second half of the alphabet
   * Is one of the most popular letters (By frequency)
2. Validate whether a numerical input is ...
   * Odd or even
   * Divisible by any of 3/5/7/9

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
