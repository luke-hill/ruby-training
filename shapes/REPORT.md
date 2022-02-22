# Report Grade - Shapes

Report for Aiman, for the Shapes project

## Grading Criteria

Each of the following points will be used
* Following TDD principles - **30%**
  * Are you following TDD principles?
  * Did you write the minimum to make some tests pass and then improve?
  * Did you iterate on your work?
  * Did you do red-green-refactor?
* Pass Rate - **40%**
  * Did your code pass when I ran it?
  * Did you follow the rules set out for completing the work?
* White box analysis - **30%**
  * Is your code neat and tidy?
  * Is your code easy to understand / follow?
  * Does your code solve only the problem stipulated (i.e. you've not tried to over-engineer the solution?)

## Grades

### Following TDD principles

F

Not undertaken. Also a bit of redundant / erroneous code was left which would cause issues in other languages

### Pass Rate

A

All code passes as expected - However (avoiding double jeopardy, you have made a slight mistake)

### White box analysis

B

Marking you down here as having missing code (Your definition of equilateral and isosceles aren't completely sound)

The following (Unwritten), spec would cause a failure in your suite ...

```
  expect(triangle(3, 2, 2)).to eq(:isosceles)
```

Your code is easy to understand and follow, but there could be some small tidy-ups. You often leave quite
large nested ifs which have a poor cyclomatic score.

### Overall Grade

C

Solid good first attempt. Make sure to follow the guidelines set out for doing good incremental development
and red-green-refactor techniques

Also ensure you're playing around a little bit with your code, as sometimes the specs will miss certain points out
but you should aim to ensure that your code is as robust as possible
