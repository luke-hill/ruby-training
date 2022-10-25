### Preface

> The majority of this work is taken / adapted from Nithin Bekal @ https://nithinbekal.com/posts/ruby-decorators/
> 
> (C) Nithin Bekal - 24th Sep 2014

# Decorators - An OO Design Pattern

**NB:** Whilst this is structured for Ruby, this pattern exists in any OO language

Our task is to create an evolving cafe menu. Which predominantly rests on one item. A Burger!

We will start with a simple Burger, and steadily get more and more complex. Seeing how different patterns
can allow us to create simpler and more beautiful code.

What the Decorator pattern advocates is that you "Decorate" your existing code such that it can evolve
and as such, can then be re-decorated ontop, again and again. This building process will allow you to create
a structure that then gives you the foundations of quite advanced code, but for a cheap (relative), input.

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the exercise

Initially you should start by making all of the burger tests pass. This is a small task. Then steadily
you should evolve your code, creating new classes and modules and then later eventually removing some of
these complex classes / modules - replacing them with cleaner / leaner ones.

As you come onto later pieces of code. You shouldn't ever be **breaking** your previous tests. But you _may_
need to refactor the tests themselves to handle the differing burger instantiations

## Running the tests

To run the tests for the exercise, you just need to run:

```
$ rspec
```

The first time you run this you should see a large output. Which contains:

```
Finished in 0.02342 seconds (files took 0.13952 seconds to load)
9 examples, 9 failures
```

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
