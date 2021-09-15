# Ruby: The Language

We are going to take a trip around ruby the language. Ruby is a large language
with many nooks and crannies. We won't cover everything, but we will give you
enough information that you can get started, and know where you can go to
discover more.

As we work through the various lessons, you will be using a ruby testing tool
called [RSpec](https://github.com/rspec/rspec). Some of the syntax used may look
unfamiliar, but it should be quite readable. We will learn what all of the
syntax means as we work through the problems.

We are going to perform a set of exercises called Koans. Adapted from the Ruby-Koans guide.
Koans are akin to how you may have solved primary school maths, with such problems as
`2 + _ = 5` - What is the missing number? It is obviously 3.

Here we have the same problem. Starting with nice easy ones like `expect(1 + 1).to eq (__)` and
ending with metaprogramming concepts that will allow you to send messages between 2 different "Classes"
(A class is just a single thing, like a dog or cat).

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

The first time you run this you should see the following output:

```
F

Failures:

  1) Learning ruby using expectations checks reality
     Failure/Error: expect(true).to be false # it should be true
     
       expected false
            got true
     # ./spec/1-easy/an_introduction_spec.rb:6:in `block (3 levels) in <top (required)>'

Finished in 0.0085 seconds (files took 0.07892 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/1-easy/an_introduction_spec.rb:5 # Learning ruby using expectations checks reality
```

This is telling you there is a failing test in the `spec/introduction_spec.rb` file on line 6.

For this first test, the test says that `true` should be `false`. Which is obviously wrong.
Fix this up and then re-run your tests using the `rspec` command.

Then inside this file continue by filling in the `__` blanks. Each of these needs changing.

Each time you want to check your work remember to rerun `rspec`.

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
