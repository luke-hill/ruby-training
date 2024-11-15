# Metaprogramming - Programming ... "on the fly"

### Project: Basic Metaprogramming

**NB:** Whilst a small amount of coding will take place here. This is one of the harder mini-projects

Our task is to create some runtime code. We do this by performing a task known as metaprogramming.
It also has other names such as "programming-on-the-fly" or "dynamic programming". But the
essence is the same for whatever name is being used to represent it.

In our project here we are just going to create some basic concepts, so you can see how the ecosystem works
for ruby. Fundamentally we will be using the method `define_method` which allows you to define methods on the
fly and adapt them at runtime.

**NB:** Define method is defined on an Eigenclass. i.e. the Constructor, not the instance. So you need
to think about how you manipulate yourself from instance to class! (See `the-language` for help if needed).

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

Do not worry though, these tests are simply here to ensure that you adhere to the rules whereby you
do not edit or remove the pre-existing methods. A bit similar to the `proxy` project we just completed

```
Finished in 0.01238 seconds (files took 0.03721 seconds to load)
7 examples, 5 failures
```

## Committing your work

It's important to commit your work regularly. Make sure you are working on a branch, not main.
Ideally use your commits to keep your own comments and notes about what you've learnt.
As you work through the exercises we'll try to come back together periodically to discuss.
