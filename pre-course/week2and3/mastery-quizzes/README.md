# Mastery quizzes

* [Setup](#setup)
* [How to work through the quizzes](#how-to-work-through-the-quizzes)
* [How to complete a quiz](#how-to-complete-a-quiz)
* [Fixing problems](fixing_problems.md)

## Setup

1. **Fork** (not clone) this [mastery-quizzes repository](https://github.com/makersacademy/mastery-quizzes).

2. Then clone **your** fork to your computer. (Or to Cloud9 if you're on Windows.)

3. Make sure you have ruby installed.  To check your Ruby version, run the command below (it should be version 2.7.3).

```
$ ruby -v
```

4. If required, use [RVM](https://rvm.io/) to install version `2.7.3`.

5. Install bundler.  To do this, run:

```
$ gem install bundler 
```

6. Using `cd`, navigate to the `mastery-quizzes` repository you just made. 

7. Install the gems required by this repository. In the `mastery-quizzes` repository, just run:

```
$ bundle install
```

8. Note that your clone will not have any quizzes in it, yet.  When you've completed a chapter, you can get a quiz by following the [How to complete a quiz instructions](#how-to-complete-a-quiz) below.

## How to work through the quizzes

1. Work through the numbered chapters (beginning with `chapter1`).

2. Work through a chapter.

3. When you've absorbed the content of the chapter thoroughly, [get and complete the quiz](#how-to-complete-a-quiz).

4. If you get stuck and can't complete a quiz, contact your coach on Slack and they'll give you feedback to help you learn what you need to complete the quiz.

5. Once you have submitted your quiz answers, and your answers have been verified as correct, continue to the next chapter.

Your aim is to get through all the chapters, but the most important thing for your learning is to only move on from a chapter once you've completed the quiz.

## How to complete a quiz

1. [Get the quiz](#1-get-the-quiz).
2. [Write code to answer the quiz questions](#2-write-code-to-answer-the-quiz-questions).
3. [Check that your answers pass the automated tests](#3-check-that-your-answers-pass-the-automated-tests).
4. [Commit and push your answers](#4-commit-and-push-your-answers).
5. [Submit and verify your answers](#5-submit-and-verify-your-answers).

### 1. Get the quiz

* There is one quiz per chapter.

* You can only get a quiz after you've successfully submitted and verified answers for the previous quiz.

* Go to https://hub.makersacademy.com

* The URL in the browser address bar will look like this: `https://hub.makersacademy.com/students/[NUMBER HERE]`

* Click the "Get Quiz" button.

* Use git to pull the quiz to your local repo.

### 2. Write code to answer the quiz questions

* Each question is in a separate file e.g. `chapter1/quiz1/question_1.rb`.

* A typical question file might look like this:

```ruby
# Write a program that adds 7 to 5, multiplies that by 10, subtracts 2 from all that, divides all that by 4, adds 1,000,000 to all that and `puts`es the result.

# Your answer here.
```

* To answer a question, type code that solves the question into the question file.

* You can run the question file like a normal ruby program `e.g. ruby question_1.rb`.

### 3. Check that your answers pass the automated tests

Your code will be automatically tested that it correctly fulfills the requirements (outputs the correct results) and that it is well written code. These automated tests are done using RSpec - a very commonly used testing tool for Ruby. You might find it useful to read the [Fixing Problems](https://github.com/makersacademy/mastery-quizzes/blob/master/fixing_problems.md) guide that explains tests and understanding errors. Take a look at the [RSpec Pill](https://makersacademy.teachable.com/courses/makers-academy-mastery-precourse/lectures/3989149) for a more general overview. Don't worry too much about creating your own tests at this point as that's what you'll do loads of in Week 4!

* To check your answer for a question:

```
$ cd chapter1/quiz1
$ rspec spec/question_1_spec.rb
```

* To check your answers for all the questions in a quiz:

```
$ cd chapter1/quiz1
$ rspec
```

* In order to be judged correct, your code must pass all the automated tests for the quiz.

### 4. Commit and push your answers

* Use Git to commit your answers to your local Git repo.

* Use Git to push your answers to your repo on GitHub.

### 5. Submit and verify your answers

* Go to https://hub.makersacademy.com

* The URL in the browser address bar will look like this: `https://hub.makersacademy.com/students/[NUMBER HERE]`

* Click the "Submit Quiz" button.

* In order to be judged correct, your code must pass 100% of the automated tests for the quiz.

## Fixing problems

* Look at the [fixing problems](fixing_problems.md) guide.
