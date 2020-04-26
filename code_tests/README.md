# Ruby Code Tests

A small set of ruby code tests, each of them is split into a small lib file (Which needs coding),
and then a set of specs that need to be fulfilled

1. Create a class that can convert numbers into words
1. Create a fizz-buzz game that works up to 30.
1. Create a class that can convert an array of numbers into a more human readable range-style set
1. Create a class that can iterate through an array, and return the missing number

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the exercise

To run the exercise, Run rspec for an individual file. For example

```
$ rspec spec/number_converter.spec
# OR
$ rspec spec/fizzbuzz_spec.rb
```

These should all fail to start with. So now fix them up.

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not master. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
