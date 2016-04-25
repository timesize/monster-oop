<!-- 
author: @nathanallen
used_by: 28
 -->

# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Regular Expressions: Now you have two problems

<img width="400" src="https://media.giphy.com/media/wA1dMk0L5gcVi/giphy.gif">

| Objectives |
| :---- |
|   Recognize patterns in text, like numbers, alphabet characters, and whitespace |
|   Use ruby's `str.match` method to detect sequences of characters |
|   Write regular expressions to validate the format of raw user input |


Regular expressions offer programmers a powerful way to describe repeated patterns in text:

- alphabet characters: `a-z` and `A-Z`
- numbers: `0-9`
- whitespace: tabs `\t`, and spaces `\s`

We can match for explicit sequences that show up _anywhere_ in the string:

- `"hello".match(/o/)` - contains the letter "o"
- `"cat".match(/cat/)` - contains the word "cat"

We can match for repeated sequences using **grouping** (parantheses) and curlies (`{min,[max]}`):

- `"look a cat!".match(/(cat){1}/` - contains "cat" 1 time in a row
- `"catcatcat".match(/(cat){3}/` - contains "cat" three times in a row
- `"catcatfish".match(/(cat){1,3}fish/` - contains "cat" 1-3 times in a row, followed by "fish"

For some common cases, we can simplify by using `?` (0 or 1), `*` (0 or more), and `+` (1 or more):

- `"He typed: redrum redrum redrum".match(/(redrum ?)+/` - contains "redrum" (with or without a space) 1 or more times in a row

We can match for this word or that word, using a pipe `|`

- `"dog".match(/dog|fish/)` - contains "dog" or "fish"
- `"catfish".match(/dog|fish|cat/)` - contains "dog" or "fish" or "cat" (which matches first?)

We can also match for groups of letters, called **match groups** using brackets (`[]`), for example:

- `"a".match(/[aeiou]/)` - contains a vowel
- `"A".match(/[aeiouAEIOU]/)` - contains an upper or lower case vowel?
    + `"A".match(/[aeiou]/i)` - this works too (note the "case insensitive" flag `i`)
- `"7".match(/[0123456789]/)` - contains an integer
    + `"1".match(/[0-9]/)` - this works too (note the range indicated by the dash in `0-9`)

For some common cases, we can simplify by using some built-in match groups like: `\w` (word characters) and `\s` (whitespace characters).

We can also use the `.` operator to match for _any_ single character.

- `"my favorite symbol is %".match(/my favorite symbol is ./)` - contains any character

But what if you actually need to check for a period? Since `.` is a reserved keyword we need to escape literal dots/periods using a backslash (`\`).

- `"1.1".match(/[0-9]\.[0-9]/)` - contains an integer followed by a literal decimal point, followed by an integer

We can also negate match groups, if we want to ensure that certain characters are _NOT_ present anywhere in the string, using a `^` inside our brackets.

- `"h3ll0".match(/[^aeiou]/)` - contains no vowels

And finally, we can talk about boundaries, like "carriage returns" (what happens when you hit the `enter` key), spaces, tabs, etc. And we can describe the beginning (`^`) or end (`$`) of a string to ensure that our match occurs in a specific location.

- `"dogfish"` .match(/^dog/) - starts with "dog"
- `"dogfish"` .match(/fish$/) - ends with "fish"

#### Everybody Stand Back!

<img title="XKCD Comic: I Know Regular Expressions" src="http://imgs.xkcd.com/comics/regular_expressions.png">

> "Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems." ([source](http://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/))

## Resources

- [Rubular](http://rubular.com/) - A handy editor for checking your regex
