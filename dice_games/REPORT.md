# Report Grade - {project_name}

Report for {person_name}, for {project_name} project

## Grading Criteria

Each of the following points will be used
* Following TDD principles - **30%**
  * Are you following TDD principles?
  * Did you write the minimum to make some tests pass and then improve?
  * Did you iterate on your work?
  * Did you do red-green-refactor?
* Pass Rate - **30%**
  * Did your code pass when I ran it?
  * Did you follow the rules set out for completing the work?
* White box analysis - **30%**
  * Is your code neat and tidy?
  * Is your code easy to understand / follow?
  * Does your code solve only the problem stipulated (i.e. you've not tried to over-engineer the solution?)
  * Have you removed all redundant code
* Miscellaneous Criteria - **10%**
  * Git commit history (Easy to understand / follow)
  * Did you manage to refactor the test on `spec/dice_spec.rb:41`

## Grades

### Following TDD principles

D

You have written the minimum to make the first tests pass and then after that I cannot really see an evolution
of your code. There is also no refactoring really done and the code is written almost in a code-golf style way

### Pass Rate

B

All the tests pass, but we have twice as many tests, because you've modified the original files which you
shouldn't be doing. As such you can't score the top mark.

### White box analysis

D

The code fails almost every style based linting guide as well as the ruby based linting rules. Verbose idioms have
been used instead of the more ruby-ish based ones which are better and more performant.

Almost no refactoring taking place has led to the code being very clunky and almost impossible for a second person
to come in and take charge of (Something which I mentioned a couple of times in our sessions).

Some of the branches inside your conditional logic are also duplicated / redundant (Again a symptom of not
doing enough refactoring).

Because the solution to the greed spec is quite elegant, the grade has been bumped from an E to a D, but the overall
approach across both exercises is quite poor.

### Miscellaneous Criteria

F

No attempt made to solve either problem.

### Overall Grade

D

Come chat to me afterwards if you are finding specific areas hard. It seems as though you're making the same
repeated mistakes over and over, as if something hasn't quite stuck from the training. Given you didn't mention
any issues during the first few weeks, I'm not really sure why this is happening.
