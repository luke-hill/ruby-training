# 99 Bottles of Beer!

Whilst I am english, given the nursery rhyme here is written in American style, we will go with that.

The purpose of this is a first pass introduction at TDD - Test Driven Development. The principle of which
states that if you wish to develop good software, first you develop good tests for what the software
should do or conform to. Then **and only then**, do you write the actual software to do the job.

Here we have a problem, which has all of the tests defined, but no application code - Our job is
to write the application code, such that all of the tests pass.

In the real workplace, this is sometimes done, but often a hybrid of TDD, BDD (Behaviour Driven Development),
and coding upfront is done. So this exercise, should give you the skills to isolate a problem down
into its smallest components.

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
F******

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) singing 99 bottles of beer can sing another typical verse
     # No reason given
     # ./spec/bottles_spec.rb:13

  2) singing 99 bottles of beer can sing about 1 bottle
     # No reason given
     # ./spec/bottles_spec.rb:19

  3) singing 99 bottles of beer can sing about 2 bottles
     # No reason given
     # ./spec/bottles_spec.rb:25

  4) singing 99 bottles of beer can sing about no more bottles
     # No reason given
     # ./spec/bottles_spec.rb:31

  5) singing 99 bottles of beer can string a few verses together
     # No reason given
     # ./spec/bottles_spec.rb:37

  6) singing 99 bottles of beer can sing the whole song
     # No reason given
     # ./spec/bottles_spec.rb:43


Failures:

  1) singing 99 bottles of beer can sing a typical verse
     Failure/Error: expect(song.verse(8)).to eq(expected)
     
     NoMethodError:
       undefined method `verse' for #<Bottles:0x000055de17b99560>
     # ./spec/bottles_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.00226 seconds (files took 0.06216 seconds to load)
7 examples, 1 failure, 6 pending

Failed examples:

rspec ./spec/bottles_spec.rb:8 # singing 99 bottles of beer can sing a typical verse

```

This is telling you there is a failing test in the `spec/bottles_spec.rb` file on line 8.

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not master. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
