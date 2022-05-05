# Proxying

### Project: Create a Proxy Class

**NB:** Whilst a small amount of coding will take place here. This is one of the harder mini-projects

Our task is to solve a proxying problem. A "Proxy" is essentially a way in which one "thing" can do the job
of another "thing". One example could be making Coffee. We could make it ourselves, or we can buy a fancy
Coffee Maker, press 2 buttons, and walk away for 5 minutes whilst it works its magic

In our project here we are dealing with what could be considered to be a TV Remote control, which is just
another form of a Proxy. For example we "could" walk up to the TV and change the channel manually.
But most of us just use a TV Remote control. So here we are going to look at how we can tell one "thing"
(For example a TV Remote Control), talk to another "thing" (The TV)

It is worth pointing out this exercise will allow you to generate a mutable proxy. That is a Proxy that in theory
could work in multiple ways (The spec file will explain this in more detail)

We will do this in the following way ...

1. Create an initial proxy class
2. Allow the proxy object to be initialized with **ANY** object Ruby could provide
3. Ensure that when proxying, messages that are sent are correctly targeted (Ensure you add
the correct handlers for `method_missing` and `respond_to?`)
> NB: The handler for `respond_to?` will need 2 specific checks. One for the proxy object **but also itself!**
4. A record should be created for every message sent

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
only edit the single `proxy.rb` file. You are **not permitted** to edit the `lib/television.rb` file!

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not main. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
