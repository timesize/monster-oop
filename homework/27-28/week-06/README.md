# Week 6 Homework

The homeworks and readings below are intended to prepare you for the next day's lectures. Please complete them first.

If you have any remaining time, please complete/review the exercises from dawn and dusk lectures. You can also review the morning drills.

Please refer to the [Instructions for Submitting Homework](/how-to/homework-submission.md).


## Day 1

1. Coding: Finish up [tunely-angular sprint 5](https://github.com/SF-WDI-LABS/tunely-angular/blob/master/docs/sprint5.md). 
1. Reading: You don't need to master all the technical details, but try for a high-level understanding of the questions below.
      * Angular's [Conceptual Overview, Services Section](https://code.angularjs.org/1.5.1/docs/guide/concepts#view-independent-business-logic-services). Read to understand:
         * When woud you use a service? What are services good for?
         
      * Angular's Custom Directives Guide, the [What are Directives?](https://code.angularjs.org/1.4.10/docs/guide/directive#what-are-directives-) and [Matching Directives](https://code.angularjs.org/1.4.10/docs/guide/directive#matching-directives) sections. Read to understand:
         * What are directives?
         * When would you use a directive?
         * What does it mean for Angular to "compile" a directive?

Please use any remaining time to complete and review these other resources available below:

* [Goat Tracker 95](https://github.com/sf-wdi-27-28/goat_tracker_95)
* [geoquakes-angular](https://github.com/SF-WDI-LABS/geoquakes-angular.git)
* Try adding an [Angular UI Bootstrap directive](https://angular-ui.github.io/bootstrap/) to one of your projects!



## Day 2

1. Coding:
    - Submit a pull request on [Cards Against Assembly](https://github.com/SF-WDI-LABS/angular-custom-directives/tree/master) to show us how far you got. It doesn't have to be complete; we just want to see what you have.  Follow the submission instructions above.
    - Finish the delete functionality in the refactored services [Library App](https://github.com/SF-WDI-LABS/angular_books_api_with_services). Follow the submission instructions above to make a pull request. 
1. Watch [this awesome video about how JavaScript works](https://www.youtube.com/watch?v=8aGhZQkoFbQ)!
1. Angular Review Prep
    - Complete the [Angular Self-Assessment](https://docs.google.com/forms/u/0/d/1iSkktIKSi20hcAmBQ3a5jtMe1W8OcjHKMnNQimQ6cG4/viewform) and identify 2 topics you want to review tomorrow
    - Ask and/or upvote 3 questions on QuestionCookie: http://www.questioncookie.com/wdi-27-28-w6.5-review

Please use any remaining time to complete and review the material from today.

## Day 3

1. It's time to take a break from Javascript and start in on Ruby!  Check out <a href="http://www.tryRuby.org" target="_blank">this</a> light and gentle introduction to Ruby.  It's a fun and easy little tutorial that will guide you through the basics.  Have fun!

Please use any remaining time to complete and review the exercises from dawn & dusk. 

## Day 4
# Ruby Koans

## About Ruby Koans

Go to the Ruby Koans [website](http://rubykoans.com/) and click the link to download the koans. Open the zip file and save it in your `wdi` directory. `cd` into the `koans` directory and run `ls`. Wow, that's a lot of files!

Each file is a self-contained exercise that will teach you a bit about Ruby, using test driven development. Essentially you will be given code that has something wrong with it, as well as instructions about what needs to be fixed. Then you make the necessary changes for the tests to pass.

For example, running this file in the Terminal
```bash
:> ruby about_hashes.rb
```
will output this:
```ruby
AboutHashes#test_creating_hashes has damaged your karma.

The Master says:
  You have not yet reached enlightenment.

The answers you seek...
  Expected "FILL ME IN" to equal Hash

Please meditate on the following code:
  about_hashes.rb:6:in `test_creating_hashes'

mountains are merely mountains
your path thus far [X_________________________________________________] 0/12
```

While it may look verbose, all this output is doing is explaining why the code isn't running and stating which line (and which method, if applicable) to fix. Each time a fix is made, the koan will provide a new prompt when the file is run again.

Each koan file has some blanks you should fill or lines you should change in to "reach enlightenment" or pass all of the code's tests.  Read the comments in a koan file one by one to see what each part should do. If you're unsure what one of the tests is asking for, try a few things, ask in Slack, and skip it if you need to instead of getting stuck.

The koan files have some structure we haven't seen yet. Methods are defined by the blocks that start with `def` and end with `end` -- these reserved words are like the curly brackets of Ruby methods. Also, the `class` line in each file is a way of organizing the code and grouping the methods together.


Example of completing parts of a koan (from `about_hashes.rb`):

```ruby
require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutHashes < Neo::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal Hash, empty_hash.class
    assert_equal({}, empty_hash)
    assert_equal 0, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.size
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal "uno", hash[:one]
    assert_equal "dos", hash[:two]
    assert_equal nil, hash[:doesnt_exist]
  end
end
```

#### Reference

Reference <a href="http://ploos.io/ruby-koans-companion-part-10-about_methods-rb/" target="_blank">this reading on Ruby methods</a> for discussion of how the koans' methods are structured.

<!-- @TODO - check/confirm location ofruby method reading file -- should this just live in hw folder? -->

## Exercises

Base Exercises:

`cd` into your new `koans` directory and run through the following exercises using `ruby <file_name.rb>`.

- About Asserts - `about_asserts.rb`
- About Arrays - `about_arrays.rb`
- About Nil - `about_nil.rb`
- About True and False - `about_true_and_false.rb`
- About Strings - `about_strings.rb`
- About Methods - `about_methods.rb` (through `method_without_explicit_return`)

Stretch Exercises:

- About Hashes - `about_hashes.rb`
- About Blocks - `about_blocks.rb`
- About Objects - `about_objects.rb`
- About Variable Scope - `about_variable_scope.rb`
- About Iteration - `about_iteration.rb`


<!-- 
## Day 5 - Weekend Homework

1. Reading
2. Weekend Lab

Please use any remaining time to review exercises/drills from the week! And don't forget to sleep!
-->
