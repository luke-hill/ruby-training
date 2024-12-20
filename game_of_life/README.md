# Conways Game of Life

### Project: Create a representation of Conways Game of Life from Scratch

**NB:** This is designed to be an extensive full-scale problem. As such the answers or solutions can be completely
different

Our task is to create a fully working Conways Game of Life representation.

Each class that is created should first be derived using tests that fail, then coded and refactored. Each class
should conform to SOLID and be runnable and queryable using IRB (Or other tools), on it's own.

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the exercise

The rules of Conways Game of Life are found here: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

You can also play a copy of it live here: https://playgameoflife.com/

When trying to isolate the parts of the game. First try and split the game up into "rough" areas or components.
For an easy start, the largest encompassing "part" of Conways Game of Life is the full game itself. Now (using pen and paper), try
and split the game into the next largest building blocks, and from there continue down until you have
a set of nice granular (small), parts.

Once you have these small components, these should then become your classes.

Make sure to Namespace everything under `GameOfLife` as a top level module. You "should" not need a 2nd level namespace.

**Everything that is a public method should be tested. 100%. No exceptions!**

#### Hints

- The representation of a Game "state" is a good starting point. Because each iteration or "tick" will generate a new state
- Testing the game state should be fairly simple because it is just a representation of the game - so test it as if the game has ended
- With Conways Game of Life, there are no real restrictions on the game. As such you should put either advisory, or compulsory
restrictions on certain features. **My advice:** Limit to the number of rows to 10 to start with, then 100
- Try not to solve more than one problem at once. Get a simple version of the game working before attempting
to make a more complex version of the game work. This is called Iterative development.

Abraham Lincoln once said

```
Give me six hours to chop down a tree and I will spend the first four sharpening the axe.
```

## Committing your work

It's important to commit your work regularly. Make sure you are working on a branch, not main.
Ideally use your commits to keep your own comments and notes about what you've learnt.
As you work through the exercises we'll try to come back together periodically to discuss.
