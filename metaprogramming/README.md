# Metaprogramming - Programming ... "on the fly"

### Project: Basic Metaprogramming

**NB:** Whilst a small amount of coding will take place here. This is one of the harder mini-projects

Our task is to create some runtime code. We do this by performing a task known as meta-programming or
programming-on-the-fly or dynamic programming

In our project here we are just going to create some basic concepts, so you can see how the ecosystem works
for ruby. Fundamentally we will be using the method `define_method` which allows you to define methods on the
fly and adapt them at runtime.

**NB:** Define method is defined on an Eigenclass. i.e. the Constructor, not the instance. So you need to think
about how you manipulate yourself from instance to class!

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

And again, you'll notice some failures.... However, there will also be some passing tests.

Do not fret though, these tests are simply here to ensure that you adhere to the rules whereby you
do not edit or remove the pre-existing methods.

```
7 examples, 5 failures, 2 passed
Finished in 0.249222376 seconds
```

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
