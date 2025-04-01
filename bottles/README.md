# 99 Bottles of Beer!

The nursery rhyme here is the americanised version of 10 green bottles

The purpose of this is a further look at TDD - Test Driven Development. The principle of which
states that if you wish to develop good software, first you develop good tests for what the software
should do or conform to. Then **and only then**, do you write the actual software to do the job.

You may be familiar with TDD after having completed some previous projects on TDD. Here however
your challenge is a bit trickier, and the code you will need to write will be required to have a bit more
complexity than some of the previous projects you may have undertaken.

Our problem here, like before, is that we have all the tests defined, but no application code - Our job is
to write the application code, such that all of the tests pass. Again similar to the other mini-projects

In the real workplace, this is sometimes done, but often a hybrid of TDD, BDD (Behaviour Driven Development),
and coding upfront is done. So this exercise, should give you the skills to isolate a problem down
into its smallest components.

## Setup

Install the dependencies:

```bash
# We don't pass in a -v flag here as every version (Including latest), of bundler should work on Ruby 3.3.6
$ gem install bundler
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

  1) Bottles can sing another typical verse
     # Remove this line once you have written code that passes the above test.
     # ./spec/bottles_spec.rb:16

  2) Bottles can sing about 1 bottle
     # Remove this line once you have written code that passes the above test.
     # ./spec/bottles_spec.rb:25

  3) Bottles can sing about 2 bottles
     # Remove this line once you have written code that passes the above test.
     # ./spec/bottles_spec.rb:34

  4) Bottles can sing about no more bottles
     # Remove this line once you have written code that passes the above test.
     # ./spec/bottles_spec.rb:43

  5) Bottles can string a few verses together
     # Remove this line once you have written code that passes the above test.
     # ./spec/bottles_spec.rb:52

  6) Bottles can sing the whole song
     # Remove this line once you have written code that passes the above test.
     # ./spec/bottles_spec.rb:68


Failures:

  1) Bottles can sing a typical verse
     Failure/Error: expect(bottles.verse(8)).to eq(expected)
     
     NoMethodError:
       undefined method `verse' for an instance of Bottles
     # ./spec/bottles_spec.rb:13:in `block (2 levels) in <top (required)>'

Finished in 0.00131 seconds (files took 0.04012 seconds to load)
7 examples, 1 failure, 6 pending

Failed examples:

rspec ./spec/bottles_spec.rb:8 # Bottles can sing a typical verse
```

This is telling you there is a failing test in the `spec/bottles_spec.rb` file on line 10.

**NB:** We introduce a new keyword here - `skip`. This is a method in RSpec that allows you
to ignore a test, be it passing or failing. This does not contribute to the overall failure
rate of the test suite - but will be mentioned in the resulting summary.

That is why in the terminal you will see 1 failure and 6 pending tests. To run these additional
tests simply delete the line featuring the keyword `skip` and the test will then run.

For your next steps, as discussed, we need to just make the first test pass. Have a quick think / chat
(in groups if appropriate), to work out what code you need to write to make Test 1 pass.

For TDD, as a purist, you want to write the bare minimum code to make the tests pass.

For this exercise, it is advised that the finished PR/PR's should have at least 10 commits in total,
detailing what changes you made and why. 

## Committing your work

It's important to commit your work regularly. Make sure you are working on a branch, not main.
Ideally use your commits to keep your own comments and notes about what you've learnt.
As you work through the exercises we'll try to come back together periodically to discuss.
