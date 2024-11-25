# Site Prism

This is a framework that allows you to create POM (Page Object Model), objects.

Once you have done this, you can use these objects to query web pages using a nice clean
semantic DSL (Domain Specific Language).

SitePrism will use procedural DSL methods like `element` or `sections` to define objects
that will exist on a page. These objects will then be created as methods alongside
helpers that will help you query them. SitePrism will also use DSL methods like `set_url`
or `load_validation` to control loading order or validations on a specific page
or section that you have created.

## Setup

Install the dependencies:

```bash
$ gem install bundler # if you don't have it already
$ bundle
```

## Working through the examples

To run the examples, you just need to run:

```
$ ruby example_1.rb
$ ruby example_2.rb
$ ruby exercise_1.rb
$ ruby exercise_2.rb
$ ruby exercise_3.rb
```

## How this will work

Each time we write some new code, we need to try observe what the code is doing, and see if we can
learn a little whilst doing it. The example exercises will be a hint to what the kinds of methods
are that you will use when doing web automation. A lot of the boilerplate code already is written.

Once you've had a look at the examples, take a look at the 3 exercises and try write the code
required to make them each functional.
