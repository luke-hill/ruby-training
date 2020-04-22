# Proxying

### Project: Create a Proxy Class

**NB:** Whilst a small amount of coding will take place here. This is one of the harder mini-projects

Our task is to solve the proxying problem, so we can have our tv proxy talk to the tv.

1. Create an initial proxy class
1. Allow the proxy object to be initialized with any object Ruby _could_ provide
1. Ensure that when proxying, messages sent are correctly targeted
1. As each message is being sent, a record should be created once the message passing has been completed
1. During the coding, ensure you add the correct handlers for `method_messing?` as well as other items

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
only edit the single `proxy.rb` file

## Committing your work

It's important to commit your work regularly. Make sure you are working on a
branch, not master. Ideally use your commits to keep your own
comments and notes about what you've learnt. As you work through the exercises
we'll try to come back together periodically to discuss.
