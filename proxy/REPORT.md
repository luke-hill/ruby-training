# Report Grade - Proxy

Report for Isaac, for the Proxy project

## Grading Criteria

Each of the following points will be used
* Following TDD principles - **25%**
  * Are you following TDD principles?
  * Did you write the minimum to make some tests pass and then improve?
  * Did you iterate on your work?
  * Did you do red-green-refactor?
* Pass Rate - **40%**
  * Did you follow the rules set out for completing the work?
  * Were you able to create the proxy? (Spec #1)
  * Can you proxy all standard methods? (Specs #2/#3)
  * Were you able to differentiate between methods that should/shouldn't be proxied? (Spec #4)
  * Were you able to enhance your proxy to perform some logging? (Specs #5-#10)
* White box analysis - **25%**
  * Is your code neat and tidy?
  * Is your code easy to understand / follow?
  * Does your code solve only the problem stipulated (i.e. you've not tried to over-engineer the solution?)
  * Have you removed **all** redundant code
* Miscellaneous Criteria - **10%**
  * Git commit history (Easy to understand / follow)
  * Did not amend any of the prohibited files

## Grades

### Following TDD principles

C

You still are doing large clumps of work simultaneously, which makes it hard to track exactly what is being
done at any one time

Also ensure you are correctly describing your work by doing the minimum or simplest fix for a piece of work
and then ensuring your commit marries up to that

### Pass Rate

A - No issues

### White box analysis

B

There are no major flaws in your code, and it is reasonably well optimised

But there are 2 main issues
- Using both a reader and the object itself - pick one or the other (Reader preferred)
- Not recognising some redundant code paths

### Miscellaneous Criteria

C

Your git commit history is simple to follow at first, and then it gets very bloated near the end of a project

You need to ensure that this doesn't happen when working on real solutions

### Overall Grade

B

A very good grade and a definite improvement on the whitebox side of things

Try to ensure your git / tdd work isn't slipping though when focussing on other improvements
