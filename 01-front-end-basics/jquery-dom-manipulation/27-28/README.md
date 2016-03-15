# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Intro to jQuery and the DOM

| Objectives |
| :---- |
| *__Students will be able to:__* |
| Use the Chrome Developer Tools and the Console |
| Describe visualize the Document Object Model (DOM) of an HTML document|
| Explain the relationship between JavaScript and jQuery and the benefits of using jQuery for DOM manipulation |
| Select elements from the page using CSS Selectors and use jQuery to dynamically change the DOM |

#### Chrome Developer Tools
To open the developer tools, press `cmd-option-i` on a webpage in Chrome.

Please take a quick look at the following documentation for the [Chrome Developer Console](https://developer.chrome.com/devtools), specifically the [Elements tab](https://developer.chrome.com/devtools/docs/dom-and-styles), and the [Console tab](https://developer.chrome.com/devtools/docs/console) (Max 20 minutes). This is one of the most important tools in your developer toolbelt.

#### What is the DOM?
DOM stands for __Document Object Model__. It's a fancy way of describing what's going on in your browser when you visit a website. You may think that a website is just a chunk of html, css, and javscript. But between it being pure data (text), and it being a rendered page that you can explore, there's an important intermediate step. It turns out that everything you interact with inside of your browser can be represented as a javascript `object`. For example, this paragraph is an object, and it's full of information about being an html `p` tag.


### DOM Analogy: The Human Body

* HTML = Skeleton
* Javascript = Muscles, Brain, and Organs
* CSS = Skin and Clothing

![muscles](https://cloud.githubusercontent.com/assets/7833470/10700126/8e2997da-7970-11e5-96ba-1e5eaf793394.jpg)

### DOM visualization
The DOM is often visualized as a "tree"

![DOM tree](https://cloud.githubusercontent.com/assets/6520345/13718763/0ab9a2a0-e7a2-11e5-9214-7a063f26af19.png)
[Image source](http://www.w3schools.com/js/pic_htmltree.gif)

__Write out the HTML that the above DOM tree represents.__

The DOM tree visualization is a great starting point for understanding the DOM, but it often leaves out a lot of the details of what's going on.

Firefox, which has its own set of developer tools, also  has a great tool for looking at the stacking of the DOM.

Hit this button:
![gear button](https://cloud.githubusercontent.com/assets/6520345/13718657/da0b2b48-e7a0-11e5-83ae-93f0d6afb241.png)

Make sure the 3D view is checked:
![3d view check box](https://cloud.githubusercontent.com/assets/6520345/13718685/16cf81a0-e7a1-11e5-96cc-e903f969cbbe.png)

and click the cube looking button:
![cube button](https://cloud.githubusercontent.com/assets/6520345/13718634/b128b024-e7a0-11e5-8001-7806557ae99b.png)

Check out what clicking that button does to [The New York Times](nyt.com) and [Buzzfeed](buzzfeed.com).


## Intro to jQuery
jQuery is just JavaScript! It was invented in 2005 and has made our lives as developers better ever since.

We use jQuery because it's:

- Convenient: solves problems developers commonly face.
- Less Buggy: ensures javascript DOM manipulation works the same, cross-browser.
- Modern: brings javascript DOM manipulation into the 21st century.
- Popular: 26.95% of all sites use jQuery! (see Builtwith.com).

But some would argue, [you might not need jQuery](http://youmightnotneedjquery.com/)! It can be overkill, depending on what you're doing!

#### How to get jQuery
You can only use jQuery if it's included in your page.

To do this, we have two options:

###### 1. Reference jQuery from a server on the internet:

  The quickest way to include jQuery in your project is to grab the jQuery library using a "CDN" (a blazing fast "content delivery network") and dropping it into a script tag in the head of your html (just google "jQuery cdn" and copy paste!):


``` html
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    </head>
    <body>
        <!-- Nothing here yet! -->
    </body>
</html>

```

Sites like: github.com, css-tricks.com, and jquery.com (!) all include the jQuery library on their page. This means all you have to do is open up your Chrome Developer Console on one of those sites, and you can start playing with jQuery on the page!

###### 2. Download a copy of jQuery to host in your own project:

  [CDNJS](http://www.cdnjs.com), [Google Hosted Libraries](https://developers.google.com/speed/libraries/), and the [jQuery site](http://www.jquery.com) will all allow you to download a copy of jQuery to include in your projects. This means that the whole source code is in your project. If there are updates on that source code, you will need to make sure to update the version you have downloaded (kind of a pain).


#### Using jQuery
You know you're working with jQuery any time you see a `$()` in your code. `$` is an abbreviation for using the function name `jQuery` all over your code.

As you're working with jQuery to manipulate DOM elements, you are almost always either *getting* or *setting* a value. Memorize this pattern:  
- `$("CSS Selector").someJqueryMethodName()` - **getting** a value  
- `$("CSS Selector").someJqueryMethodName(setterValue)` - **setting** a value

For example, if you are viewing this readme on github.com, then you can try the following in your Chrome Developer Console:  
- `$('article').text()` -- **get** the text of the readme (it lives inside of an `article` tag)  
- `$('article').text("Boo!")` -- **set** the text of the readme to "Boo!"

Wowza!
![wow](https://cloud.githubusercontent.com/assets/6520345/13719043/1bdbe8ce-e7a5-11e5-96ac-ea05ad01df88.gif)

Let's try another:  
- `$('article').css("background-color")` -- **get** the background color  
- `$('article').css("background-color", "blue")` -- **set** the background color to blue.

#### Documentation
Check out the `.text()` and `.css()` methods in the jQuery API Documentation: [text](http://api.jquery.com/text/), [css](http://api.jquery.com/css/).
- Pay close attention in the documentation: there's one section that talks about how to "get" text, and there's another section that talks about how to "set" text.
- `.text()` and `.css()` are not native javascript methods! They only work on jQuery-wrapped DOM Elements (that's what that `$` is doing).

For more cool DOM manipulation tricks, you'll need to hit the docs:
- jQuery API [Documentation](jquery.com)
    - [Manipulation Methods](http://api.jquery.com/category/manipulation/)
    - [DOM Tree Traversal Methods](http://api.jquery.com/category/traversing/)

The more you struggle with this kind of documentation, the stronger your coding-chops will become!


#### jQuery is just Javascript
Everything you do in jQuery can be done in pure/vanilla javascript.

Take a look at the [raw jquery library](http://code.jquery.com/jquery-2.1.3.js) (it's just a bunch of javascript!).

jQuery often saves *you* a bunch of time. Because it's just JavaScript under the hood, some argue [you might not need jQuery](http://youmightnotneedjquery.com). It's always less efficient for the computer to execute jQuery (this often doesn't matter though) and it sometimes can be overkill, depending on what you're doing.

Take a look at [this](http://bl.ocks.org/joyrexus/5322252) Comparison of jQuery and Vanilla JS</a>. Here are some of the basic differences:

**Selecting Elements**

```js
// jquery
var $divs = $('div');

// vanilla js
var divs = document.querySelectorAll('div');
```

**Selecting Elements by Class**

```js
// jquery
var $content = $('.content');

// vanilla js
var content = document.getElementsByClassName('content');
```

**Selecting Elements by Id**

```js
// jquery
var $about = $('#about');

// vanilla js
var about = document.getElementById('about');
```

**Creating Elements**

```js
// jquery
var $newDiv = $('<div></div>');
$('body').append($newDiv);

// vanilla js
var newDiv = document.createElement('div');
document.body.appendChild(newDiv);
```

## Practice
- [CSS Selector Challenge](exercises.md) - [solutions](solutions.md)
- [Indiana Jones and the Temple of DOM](exercises.md) - [solutions](solutions.md)
- [Hack Github with jQuery](jquery-github-hack-exercise) - [solutions](jquery-github-hack-exercise/solutions.md)
