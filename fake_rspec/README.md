# Fake RSpec

RSpec is a testing tool we use to perform assertions. Fundamentally it is comprised of 3 items.

- An Expectation: This is an object which will be our "found" value
- A Matcher: This is a rule that tells you how to compare a with b
- An Assertion: This is an object which will be our "assumed" value

Mathematically RSpec performs the following binary operation.

```
  Object A -> BinaryOperator -> Object B
```

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the exercise

To run the exercise, you just need to run:

```
$ ruby ./spec/easy_example.rb
$ ruby ./spec/medium_example.rb
$ ruby ./spec/hard_example.rb
```

Naturally there are bugs and failures. Our challenge is to start improving each of them to such a state
where we think the output is correct for that level of granularity

To start with.... if this were regular RSpec. We would get a lot of diagnostic data.

So one of the first challenges, is to take the existing items. To this we can add some diagnostic data

We could then look into more diagnostic data, more flagging e.t.c.

Once you're happy with fixing up existing ones, there is a sample file for you to edit and make your own
individual tests in.

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
