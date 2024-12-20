# Nim

### Project: Create an entire Nim Stack from Scratch

**NB:** This is designed to be an extensive full-scale problem. As such the answers or solutions can be completely
different

Our task is to create from scratch a 2-player Nim game interface. Using full TDD practices.

Each class that is created should first be derived using tests that fail, then coded and refactored. Each class
should conform to SOLID and be runnable and queryable using IRB (Or other tools), on it's own.

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the exercise

The rules of Nim are found here: https://en.wikipedia.org/wiki/Nim

When trying to isolate the parts of the game. First try and split the game up into "rough" areas or components.
For an easy start, the largest encompassing "part" of Nim is the full game itself. Now (using pen and paper), try
and split the game into the next largest building blocks, and from there continue down until you have
a set of nice granular (small), parts.

Once you have these small components, these should then become your classes.

Make sure to Namespace everything under `Nim` as a top level module. You "should" not need a 2nd level namespace.

**Everything that is a public method should be tested. 100%. No exceptions!**

#### Hints

- The method `gets.chomp` will be your friend. This is a top level method so doesn't need namespacing.
- Testing `gets.chomp` is particularly tricky. As such it is advised that you "mock" or "stub" the random input.
- With Nim, there are no real restrictions on the game. As such you should put either advisory, or compulsory
restrictions on certain features. **My advice:** Limit to the number of rows to 10. Limit the elements in
a row to only show if they are less than 20.
- The exercise is not to show solutions or optimal playing strategies, but to simply allow two people to play the
game.
- Try not to solve more than one problem at once. Get a simple version of the game working before attempting
to make a more complex version of the game work. This is called Iterative development.

Abraham Lincoln once said

```
Give me six hours to chop down a tree and I will spend the first four sharpening the axe.
```

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
