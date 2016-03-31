# jQuery & DOM Exercises

#### Nature Drawing 101: Draw a Tree!
* How many children does `header` have?
    - just one: the `ul` element
* Name a direct child of the `p` element.
    - the `a` elment
* Name a direct parent of the `p` element
    - the `section` element
* What is the parent of the `html` element?
    - Trick question! It turns out that `html` belongs to the `document` object, which lives inside your browser (not your html)!

#### CSS Selector Challenge
1.
* \#fancy
* p#fancy
* div p#fancy
* .page #fancy
* .page p#fancy
* div.page p#fancy

2.
* div .small
* div a.small
* .small
* div.page a.small

3.
* p a
* div.page p a
* .page p a
* div p a

4.
* .mad-favs li
* ul.mad-favs li
* div.page ul.mad-favs li
* .page .mad-favs li

5.
* .sparkles
* p.sparkles
* div p.sparkles
* div.page p.sparkles

6.
* p a.small
* p .small
* div p .small
* div.page p a.small

<!-- #### Indiana Jones And the Temple of DOM

``` javascript
// title
$("h1#san-francisco_title").text("Indiana Jones and the Temple of DOM");
$("h1#san-francisco_title").append("<small>(Rated G)</small>");

// image swap
var $target = $("div.image-wrapper img").eq(0);
var new_image = "http://media2.giphy.com/media/MS0fQBmGGMaRy/giphy.gif";
$target.attr("src", new_image);
``` -->

# Solutions - Hack Github with jQuery!

## Challenge 1 - Name Changer

`$(".user-mention").text("anonymous")`


## Challenge 2 - Add some class!

`$(".btn").addClass("btn-primary")`

## Challenge 3 - It's Shruggy!

`$(".message").text("¯\\_(ツ)_/¯")`


## Challenge 4 - I'm the captain now.

`$("#user-links").remove()`

## Challenge 5 - One big family

`$(".social-count").text("∞")`

## Challenge 6 - JustinHub!

`$(".header-logo-invertocat").html("<img src='https://avatars3.githubusercontent.com/u/1489337?v=3&s=40'>")`

## Challenge 7 - Nuclear Option

`$(".pagehead-actions").append("<li><button>Wooo</button></li>")`

## Challenge 8 - Ugh, script kiddies

`$("h1.entry-title").append(" / H4X0R3D!")`
