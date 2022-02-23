# Report Grade - Shapes

Report for Isaac, for the Shapes project

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

B

You do seem to like doing iterative development and working sequentially through it, but we definitely need
to ensure you are properly iterating and improving on your own work at appropriate times

Given you did not do any proper red-green-refactor I cannot score you an A, but you did follow the correct
principles and did everything else stipulated

NB: This would score very poorly in future projects where we measure git commit histories e.t.c. - You have
the tense and statements nailed, but you're speaking again for the code, which isn't needed. Tell me the story
as opposed to just repeating what code you fixed.

i.e. something like

> "Don't permit quadrilaterals with negative side lengths"

over

> "Fix test for 0 side-length quadrilaterals"

### Pass Rate

A

All tests pass, no major issues

### White box analysis

C

Across all three mini exercises you do vary your styling a lot, also linting isn't great either

You favour large cyclomatic if statements in some exercises but not others, suggesting the refactoring is not
always something you're comfortable doing

You have left a lot of redundant code present, especially on `else` statements (Remember this is the catch-all)

Make sure to try be consistent across your work, that way others will be also and find it easier to read

### Overall Grade

B

Very good attempt to start with. You pretty much hit all of the points required, and achieved good success
in the specific areas requested

To further push on, ensure we're following the TDD techniques that involve self-reflection on current code
(amending if appropriate), and improving on your own code by altering existing code into more optimal code
OR just removing plain redundant code (Adding it isn't a concern, not removing it **is!**)

Ensure you try to follow a consistent style throughout, and double-check your own work for linting issues
as well as generic style issues that are obvious to spot across various files
