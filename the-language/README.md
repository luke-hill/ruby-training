# Ruby: The Language

We are going to take a trip around the ruby language. Ruby is a large language
with many nooks and crannies. We won't cover everything, but we will give you
enough information that you can get started, and know where you can go to
discover more.

As we work through the various lessons, you will be using a ruby testing tool
called [RSpec](https://github.com/rspec/rspec). Some of the syntax used may look
unfamiliar, but it should be quite readable. We will learn what all of the
syntax means as we work through the problems.

We are going to perform a set of exercises called Koans. Adapted from the Ruby-Koans guide.
Koans are akin to how you may have solved primary school maths, with such problems as
`2 + _ = 5` - What is the missing number? Here it is **3**.

In these exercises in `the-language`, we will encounter the same problem - hundreds of times.
Starting with nice easy ones like `expect(1 + 1).to eq (__)` and ending with
metaprogramming concepts that will allow you to send messages between 2 different "Classes"
(A class is just a single thing or object; like a dog or cat).

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
     # ./spec/1-easy/an_introduction_spec.rb:4:in `block (3 levels) in <top (required)>'

Finished in 0.0085 seconds (files took 0.07892 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/1-easy/an_introduction_spec.rb:3 # Learning ruby using expectations checks reality
```

This is telling you there is a failing test in the `spec/1-easy/an_introduction_spec`
file on line **4**. The `:4` is a common syntax that shows you what line something is on.

For this first test, the test says that `true` should be `false`. Which is obviously wrong.
Fix this up and then re-run your tests using the `rspec` command.

Then inside this file continue by filling in the `__` blanks. Each of these needs changing.

Each time you want to check your work remember to rerun `rspec`. For this project the command will
auto-exit once it detects a single failure, meaning you can focus on just one failing test at a time.

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
