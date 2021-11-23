# Shapes

We all know that we can draw 2-dimensional shapes, such as a triangle or a square. However, how would
you check if they were correct? i.e. they could be constructed?

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
Finished in 0.01063 seconds (files took 0.05284 seconds to load)
25 examples, 25 failures
```

Now we need to fix the specs. There are 3 files inside the `lib/` directory that we need to edit.
These three files will tell us how to solve the following problems.

1. Classify the type of a triangle, based on its side lengths
1. Classify the type of a 4-sided shape - based on its angles
1. Work out the internal and external angles of regular 5-10 sided shapes?

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
