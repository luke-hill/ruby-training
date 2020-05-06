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

The rules of Nim are found here: 

When trying to isolate the parts of the game. First try and split the game up into "rough" areas or components.
For an easy start, the largest encompassing "part" of Nim is the full game itself. Now (using pen and paper), try and
then split a game into the next largest building blocks, and from there continue down until you have nice granular
small components.

Once you have these small components, these should then become your classes.

Make sure to Namespace everything under `Nim` as a top level module. You "should" not need a 2nd level namespace.

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not master. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
