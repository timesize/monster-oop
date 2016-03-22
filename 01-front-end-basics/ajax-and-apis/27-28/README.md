# Intro to Ajax

| Objectives |
| :--- |
| _Students will be able to:_ |
| Give examples of useful APIs |
| Explain why we use Ajax |
| Use Ajax to GET & POST data to an API |

## APIs

An Application Program Interface (API) is the way in which you interact with a piece of software. In other words it is the interface for an application or a program.

  * Organizations have APIs to publicly expose parts of their program to the outside world, allowing people to send them queries and receive data (e.g. [GitHub API](https://developer.github.com/v3) ), but this is a narrow view of what the term fully encompasses.
  * Remember, even an `Array` has an API. Its API consists of all the methods that can be called on it, such as: `.forEach`, `.pop`, `.length` etc. See the full list: `Object.getOwnPropertyNames(Array.prototype)`.

A **GUI** exists to make an application more convenient for the user. An **API** does the same for its users, but with a lexical rather than a graphical interface.

## Ajax

__Asynchronous JavaScript And XML__ (Ajax) allows us to make requests to a server (ours or another application's) without refreshing the page.

Let's break that down:

__Asynchronous__ - not happening at the same time. Some of your code will be executed at a later time. Specifically, when you hear back from a server about a request you made sometime in the past. This waiting time won't hold up the performance of the rest of your page.

__XML__ - another standard for communicating data. It's mostly been replaced by JSON and Ajax doesn't require the use of XML.

You may also hear the term `XMLHttpRequest`. This is the same thing as Ajax! In fact, `window` object in the Browser has available to it another object, `XMLHttpRequest`. This is how you would make these types of requests without using jQuery.

#### Why do we care?

* Ajax lets us exchange data with the server behind the scenes. When a change is made on the client we can send off an Ajax Request to notify the server of what just happened. This is an important way to maintain state between a client and a server that communicate in HTTP, an inherently stateless protocol.

* Limiting page reloads makes our web apps feel *faster* and mostly gives our users a *better experience*. Imagine if you experienced a full page refresh every time you "liked" a post on Facebook...

#### How do we use it?

jQuery gives us a [several methods](https://api.jquery.com/category/Ajax) for making Ajax requests. We're going to stick to using the `$.ajax()` method.

## GET and POST

The HTTP protocol was designed specifically for web browsers and servers to communicate with each other in a request/response cycle.

`GET` and `POST` are the most common verbs used in HTTP requests:

  * A browser will use `GET` to indicate it would like to receive a specific web page or resource from a server.
  * A browser will use `POST` to indicate it would like to send some data to a server.

Conveniently can use Ajax to make both `GET` and `POST` requests to servers. From the perspective of the server, it is just another request.

jQuery gives us the [`$.ajax()`](https://api.jquery.com/jQuery.ajax) method, which will allow us to perform any Ajax request.

## Ajax Setup

Using jQuery's `$.ajax()` method, we can specify several parameters, including:

* what kind of request
* request URL
* data type
* callback function (which will run on successful completion of the Ajax request)

Let's try sending a get request to [Spotify's API](https://developer.spotify.com/web-api/search-item):

```js
$.ajax({
  // What kind of request
  method: 'GET',

  // The URL for the request
  url: 'https://api.spotify.com/v1/artists/1jTAvg7eLZQFonjWIXHiiT',

  // The type of data we want back
  dataType: 'json',

  // Code to run if the request succeeds; the HTTP
  // response is passed to the function as an argument.
  success: onSuccess
});

// defining the callback function that will happen
// if the request succeeds.
function onSuccess(data) {
    console.log(data);
    // celebrate!
};
```
<!--
If we're doing a simple `GET` request, we can (and should) avoid the `$.ajax()` method and use the helper method `$.get()` instead. Here, we only need to pass in the request URL and callback function for the same Ajax request as the example above.

```js
var endpoint = 'https://api.spotify.com/v1/artists/1jTAvg7eLZQFonjWIXHiiT';
$.get(endpoint, function(response_data) {
  // creating a global variable to inspect the new data is good
  // just remember to make it local once your done inspecting!
  window.newData = response_data;
});
``` -->

For a `POST` request, we can also use the `$.ajax()` method, but this time, the `method` attribute is `"POST"`. Since `POST` requests send data to a server, we also need to send an object of data (the `book`).

```js
var bookData = {
  title: "The Giver",
  author: "Lowis Lowry"
};

$.ajax({
  method: "POST",
  url: "/books", // this is a "relative" link
  data: bookData,
  dataType: "json",
  success: onSuccess
});

function onSuccess(data) {
  console.log(data);
  // celebrate!
};

```

<!-- Just like with `GET`, the `POST` request above can be refactored to use the much simpler `$.post()` method. We pass in the request URL, data, and callback function. Note: there is an equivalent [`$.get()`](https://api.jquery.com/jquery.get/) method as well.

```js
var book_data = {
  title: "The Giver",
  author: "Lowis Lowry"
};

$.post('/books', book, function(data) {
  console.log(data);
});
``` -->

#### Ajax and Event Handlers

We can combine Ajax calls with any jQuery event handlers. You may want to execute an Ajax call when the user clicks and button or submits a form.

```js
var endpoint = 'https://api.spotify.com/v1/search?q=goodbye&type=artist'

// click event on button
$('button').on('click', function(event) {
  $.ajax({
    method: 'GET',
    url: endpoint,
    dataType: 'json',
    success: onClickReqSuccess
  });
});

function onClickReqSuccess(data){
  console.log(data);
  // process data
}

// submit event on form
$('form').on('submit', function(event){
  $.ajax({
    method: 'GET',
    url: endpoint,
    dataType: 'json',
    success: onSubmitReqSuccess
  });
});

function onSubmitReqSuccess(data){
  console.log(data);
  // process data
}

```

#### Handling Success and Failure

We can't guarantee that our API will respond, or will respond quick enough. In these cases the Ajax request will fail or error. Using the `jquery.get()` shorthand we can handle these eventualities by "chaining" additional listeners to our initial request:

```js
var endpoint = 'https://api.spotify.com/v1/search?q=come%20together&type=track';

$.ajax({
  method: 'GET',
  url: endpoint,
  dataType: 'json',
  success: onSuccess,
  error: onError,
  complete: onCompletion
});

function onSuccess(data){
  /*  perform this function if the
     status code of the response was in
     the 200s */
};

function onError(res, status, err){
  /* perform this function if the
     response timed out or if the
     status code of the response is
     in the 400s or 500s (error)
     res: the full response object
     status: a string that describes
     the response status
     err: a string with any error
     message associated with that status */
};

function onCompletion(data){
  /* perform this no matter the status
     code of the response */
};
```

## Lab work

#### [Giffaw lab](https://github.com/SF-WDI-LABS/giffaw)

For a solution, checkout the `solution` branch or find it [here on GitHub](https://github.com/SF-WDI-LABS/giffaw/tree/solution).

For the bonus solution, see the `solution-more` branch or find it [here on GitHub](https://github.com/SF-WDI-LABS/giffaw/tree/solution-more).

## Further Reading

* What is [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS)?
