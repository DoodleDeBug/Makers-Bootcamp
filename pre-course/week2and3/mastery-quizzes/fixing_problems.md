# Fixing problems

* If you run into trouble, don't delete your `mastery-quizzes` repo fork!

## I can't find the quizzes in the mastery-quizzes repo

* You need to manually get a quiz.  See ["Get the quiz" in the README](README.md#1-get-the-quiz).

## One of the commands I ran on the command line during the setup results in an error

### Contact a Coach

* Contact your Coach on Slack with a description of what you did and the full error message.

## I can't get a quiz

### Do the setup instructions

* Make sure you did all the instructions in order and none of them produced any errors.

### Contact a Coach

* Contact your Coach on Slack with a description of what you did and the full error message.

## I haven't made any progress on a problem for 20 minutes

* (It's very important to note that making slow progress is OK.  If you've made a bit of progress on the problem in the last 20 minutes, maybe continue with what you're doing.)

* If you haven't made any progress for 20 minutes, use the **problem solving guide** in the Teachable resources.

## When I run the automated tests, I get an error about the `mastery_answer_code_quality` gem

### Have you run `bundle install`

* Make sure you have run bundle install in the mastery-quizzes directory, and then try running rspec again.

* If you're still getting the error, try running the tests using the following command:

```
bundle exec rspec
```

## When I run the automated tests with `rspec`, they fail

### What are automated tests?

* Automated tests are small test programs that live in a file like `question_1_spec.rb`.  These small test programs run parts of the program that you wrote (e.g. a program in `question_1.rb`) to check it conforms to the program specification.

* A program specification is a description of what your program is expected to do.  It is always in the comments at the top of the question file. e.g. in `question_1.rb`:

```ruby
# Write a program that `puts`es a number.
```

* When all the tests for a quiz question pass, you've passed that quiz question!

* Your program should do the **bare minimum** needed to follow the program specification and pass the tests.

### What should my program do?

#### You can get information about what your program needs to do from the program specification itself

This is in the comments at the top of the question file (e.g. `question_1.rb).

```ruby
# Write a program that `puts`es a number.
```

#### You can get information about what your program needs to do from the test descriptions in the test file

The test descriptions are in the test spec file (e.g. `question_1_spec.rb`). Look at the lines that look like this:

```ruby
context "user enters many numbers: 10,4,2,7,5,1" do
```

```ruby
it "`puts`es one bar for each number" do
```

#### You can get information about what your program needs to do from the actual test code

This test code is in the test spec file (e.g. `question_1_spec.rb`).

```ruby
let (:user_input) { "10,4,2,7,5,1\n" }
let (:expected_output) {
  ["----------",
  "----",
  "--",
  "-------",
  "-----",
  "-"].join("\n")
}
```

The example test code above might be hard to read right now, but if you squint you might be able to guess that the user seems to be inputting `10`, `4`, `2`, `7`, `5` and `1` and the program is supposed to `puts` a line of ten dashes, a line of 4 dashes etc.

### I can't understand the test failure error message

#### I don't know what the parts of the error message mean

Let's wring every single piece of information we can from this error!

```
 1.  Q2. Sum integers
 2.    calculates 1 + 2 + 3 + ... + 250 and `puts`es the result (FAILED - 1)
 3.
 4.  Failures:
 5.
 6.    1) Q2. Sum integers calculates 1 + 2 + 3 + ... + 250 and `puts`es the result
 7.       Failure/Error:
 8.         expect { load "questions/question_2.rb" }
 9.           .to output(/#{expected}$/).to_stdout
10.
11.       NameError:
12.         undefined local variable or method `numbers' for main:Object
13.       # questions/question_2.rb:7:in `looping_adder'
14.       # questions/question_2.rb:11:in `<top (required)>'
15.       # ./spec/question_2_spec.rb:7:in `load'
16.       # ./spec/question_2_spec.rb:7:in `block (3 levels) in <top (required)>'
17.       # ./spec/question_2_spec.rb:7:in `block (2 levels) in <top (required)>'
```

* `1` tells us which question program has the error.

* `2` tells us what the test is expecting the program to do.  That is: which part of the program specification it is checking.

* `8` shows us the part of the test code that failed.  We can tell that our `question_2.rb` file is being run.

* `9` shows us the next line of the part of the test code that failed.  We can tell that the test is expecting some particular output.  We could look in the `question_2_spec.rb` test file to see what `expected` is.

* `11` tells us that an exception has been raised that has caused the program to terminate.

* `11` tells us what type of error caused the exception.  In this case, it's a NameError, which is raised when either a variable doesn't exist, or when a variable name is syntactically invalid.

* `12` gives us more details about the error that caused the exception.  In this case, it tells us exactly what is wrong with the program! We've tried to use a variable or method called `numbers` and it doesn't exist.

* `13` is the start of the stack trace.  It tells us which line was the last to execute in our program before it terminated.  We should start our search for the error here.

* `14` to `17` show the rest of the stack trace.  These are lines that were executed before the line indicated by `13`.

* `17` tells us the filename and line number of the first line of code run right at the beginning of the program.  In this case, it tells us which test caused the error.

#### I get an error saying `cannot load such file -- mastery_answer_code_quality`

* `mastery_answer_code_quality` is a gem that is installed when you run `bundle install`.  

* Run `bundle install` to install it.

#### The test that fails is called `has acceptable code quality` and I don't know how to fix it

* For more general help on reading test error messages, see "I don't know what the parts of the error message mean" above.

```
 1.  Q1. FizzBuzz to 20
 2.    `puts`es numbers 1 - 20, except Fizz if divisible by 3, Buzz if divisible by 5, FizzBuzz if divisible by 3 and 5
 3.    has acceptable code quality (FAILED - 1)
 4.
 5.  Failures:
 6.
 7.    1) Q1. FizzBuzz to 20 has acceptable code quality
 8.       Failure/Error: expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
 9.
10.         Inspecting 1 file
11.         C
12.
13.         Offenses:
14.
15.         questions/question_1.rb:14:5: W: Lint/UselessAssignment: Useless assignment to variable - a.
16.             a = 1
17.             ^
18.         questions/question_1.rb:23:11: C: Layout/SpaceAroundOperators: Surrounding space missing for operator +=.
19.             number+= 1
20.                   ^^
21.
22.         1 file inspected, 2 offenses detected
23.       # ./spec/question_1_spec.rb:32:in `block (2 levels) in <top (required)>'
```

* `7` tells us that the test has failed because one or more parts of the code in the question file are not high enough quality.

* `15` tells us the filename and line number of a piece of code that is not high enough quality.

* `15` tells us the quality rule that this line of code breaks: `Lint/UselessAssignment`.

* `15` gives us more details on why the line of code broke the quality rule: `Useless assignment to variable - a`

* `16` shows us the actual code that breaks the quality rule.

* `17` shows us the part of the line of code that breaks the quality rule.

* `18` to `20` give us the details for another bit of code that breaks a different quality rule.

#### The `rspec` error says something about a `Diff`

* A "diff" is a list of differences between two pieces of text.

* If you see an rspec error that mentions a diff, it usually means that your program is outputting something different from what the test wants to be output.

##### Look at the diff to see exactly what the test your program to output

* A diff tells us two different things.

```diff
expected block to output /31375
$/ to stdout, but output "The sum of all integers from 1' to '250' is 249\n"
Diff:
@@ -1,3 +1,2 @@
-/31375
-$/
+The sum of all integers from 1' to '250' is 249
```

1. The first two lines tell us exactly what the test was expecting the program to output :`31375` with a new line at the end.  And the first two lines also tell us exactly what it actually output: `The sum of all integers from 1' to '250' is 249`

2. The last three lines tell us what the differences were between the two versions.  A `-` indicates a line it didn't see but expected to see.  And a `+` indicates a line it didn't expect to see but did see.

##### Check the spelling, capitalisation, spacing and line breaks of your program's output

* Computers require high precision.  If the computer checks for `E`, it expects exactly that.  It won't accept `e` or `E    ` or `E\n`.

## The tests for a quiz pass on my computer, but when I submit them with the "Submit quiz" button, they fail

### Check the tests really do pass on your computer

* When you run the tests, you should see something like this:

```
Finished in 0.0034 seconds (files took 0.20204 seconds to load)
1 example, 0 failures
```

It should say `0 failures`.

### Check you've pushed your code to GitHub

* Look at the latest commit on your repo on GitHub and check it has the same hash (the 40-character alphanumeric string) as the latest commit on your local repository.

### Check you're not running your program in the top level of your question file

* Does the question file (e.g. `question_1.rb`) have a comment like "Note: When you run the automated tests, make sure to remove from the top level of the file any calls to `run_test` or other methods."? If so, make sure you haven't done this.

### Make sure you don't have to type anything into the command line to get the tests to pass locally

* When the program you wrote uses `gets` to get user input, the automated tests for it will automatically supply simulated user input.  You should not need to type anything into the command line to get the automated tests to pass.  If you do need to, the program you wrote is not correct, yet.
