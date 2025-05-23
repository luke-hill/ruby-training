# LCD screens

This is quite a small task in principle. But one that can be extended a lot afterwards.

We all are familiar with the digits 0-9 and the letters of the alphabet A-F. However what about
when we represent those on a dot matrix screen. So for example the number 312 might look like

```
_      _
_|  |  _|
_|  | |_
```

Apologies for the way Markdown renders ASCII style text!

And the letters "ba" may look like this

```
     _
|_  |_|
|_| | |
```

Our task is to solve this puzzle where we can render any single input as a dotmatrix display

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the exercise

To run the exercise, you just need to run rspec. To start with we just want to run the simple tests
that will check individual and composite numbers work. To do this run ...

```
$ rspec spec/numbers_spec.rb
```

The first time you run this you should see a large output. Which contains:

```
Finished in 0.00201 seconds (files took 0.03775 seconds to load)
6 examples, 6 failures
```

Once you've managed to fix up some of these tests, feel free to run all of the tests at once,
you do this by simply running `rspec` which will then yield an output that indicates there are
17 tests in total (Of which some may now be passing)

## First steps

Our job is to now write the code that makes the specs pass one at a time. However
this time it's different as we can tackle them in any way we see fit.

I would advise here we follow a purists view of TDD and make the first couple of tests pass,
and then begin to think about how to simplify and start generalising your work.
The advice is to solve the problem in the following order

1. Create a method which returns just the number `8` always - This is the easiest one
2. Optimise this solution to then return the number `0` or number `8`
3. Visualise how you partition a single digit up into a series of "pieces"
4. Find out a way to structure your code so that you could call any single number
5. Find out a way in which you need to now refactor your code to construct your number differently
as your original approach will likely not allow you to do 2 digit numbers
6. Create the logic to construct a 2 digit number
7. Create the logic to construct any length number
8. Create the logic to construct a single letter
9. Create the logic to construct any length word with letters from a-f (This is likely trivial now!)

## Stretch Goals

Now you've done all of this, let's make it different, and allow you to stretch a digit
or a letter from a-f width-wise, so they are wider

So previously 312 which looked like this

```
_      _
_|  |  _|
_|  | |_
```

May now look like this

```
____         ____ 
____|     |  ____|
____|     | |____
```

Now this will likely take a lot of refactoring. Which is left to your own devices. But once you've
done this, we'll make it even trickier by permitting you to stretch your digits height-wise. So
a digit could be taller.

So previously 74 which looked like this

```
_     
 | |_|
 |   |
```

May now look like this

```
_     
 | | |
 | | |
 | |_|
 |   |
 |   |
 |   |
```

Then naturally we'll permit both, so it can be wider and taller. Of course it goes without saying
that this needs to work for letters and numbers, and any length of letters or numbers.

So previously 'ba' which looked like this

```
     _
|_  |_|
|_| | |
```

May now look like this

```
       ___
|     |   |
|     |   |
|___  |___|
|   | |   |
|   | |   |
|___| |   |
```

Numbers and letters will never be mixed - So you won't need to solve for say
`'ab123d'` - However this could be left as an extension task after the training course is completed.

## Committing your work

It's important to commit your work regularly. Make sure you are working on a branch, not main.
Ideally use your commits to keep your own comments and notes about what you've learnt.
As you work through the exercises we'll try to come back together periodically to discuss.
