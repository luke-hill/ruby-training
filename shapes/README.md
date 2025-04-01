# Shapes

We all know that we can draw 2-dimensional shapes, such as a triangle or a square. However, how would
you check if they were correct? i.e. they could be constructed?

## Setup

Install the dependencies:

```bash
# The -v flag here is important as we're manually installing a version we "know" to work on Ruby 3.1.6
$ gem install bundler -v 2.5.22
$ bundle
```

## Working through the exercise

To run the exercise, you just need to run:

```
$ rspec
```

By now, you should know that to start with all the examples will fail ...

The output should contain (near the bottom)

```
Finished in 0.01063 seconds (files took 0.05284 seconds to load)
25 examples, 25 failures
```

Now we need to fix the specs. There are 3 files inside the `lib/` directory that we need to edit.
These three files will tell us how to solve the following problems.

1. Classify the type of triangle, based on its side lengths
2. Classify the type of 4-sided shape - based on its angles
3. Determine the internal and external angles of all regular 5-10 sided shapes?

## Committing your work

It's important to commit your work regularly. Make sure you are working on a branch, not main.
Ideally use your commits to keep your own comments and notes about what you've learnt.
As you work through the exercises we'll try to come back together periodically to discuss.
