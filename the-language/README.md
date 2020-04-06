# Ruby: The Language

We are going to take a trip around ruby the language. Ruby is a large language
with many nooks and crannies. We won't cover everything, but we will give you
enough information that you can get started, and know where you can go to
discover more.

As we work through the various lessons, you will be using a ruby testing tool
called [RSpec](https://github.com/rspec/rspec). Some of the syntax used may look
unfamiliar, but it should be quite readable. We will learn what all of the
syntax means as we work through the problems.

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle install
```

Check the environment

```bash
$ bundle exec ruby working_test.rb
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
     Failure/Error: expect( true ).to be false # it should be true

       expected false
            got true
     # ./spec/introduction_spec.rb:6:in `block (3 levels) in <top (required)>'

Finished in 0.00122 seconds (files took 0.11249 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/introduction_spec.rb:5 # Learning ruby using expectations checks reality
```

This is telling you there is a failing test in the `spec/introduction_spec.rb`
file on line 6.

Open this file read it and start filling in the `__` blanks.

Each time you want to check your work remember to rerun `rspec`.

## Commiting your work

It's important to commit your work regularly. Make sure you are working on your
own branch, not master. I suggest that you use your commits to keep your own
comments and notes about what you've learnt. As we work through the exercises
we'll come back together periodically to discuss.
