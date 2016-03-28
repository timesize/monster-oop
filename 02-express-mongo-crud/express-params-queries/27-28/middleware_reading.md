# Middleware

| Objectives |
| :---- |
|   Identify what middleware is.  |
|   Learn to make use of the body-parser middleware in Express. |
|   See the basics of writing our own middleware.  |


What is middleware? <a href="http://expressjs.com/guide/using-middleware.html" target="_blank">In terms of Express</a>, middleware is a function with access to the request object (req), the response object (res), and the next middleware in the application’s request-response cycle, commonly denoted by a variable named next.

Middleware can:

* Execute any code.
* Make changes to the request and the response objects.
* End the request-response cycle.
* Call the next middleware in the stack.

You can create your own middleware, or use third-party modules. That's right, there are tons of useful middleware modules that are already out there which you can use to handle common challenges like authentication, validation, and parsing.

The <a href="https://github.com/expressjs/body-parser" target="_blank">`body-parser`</a> module is an example of some middleware that makes Express awesome. You can use it to parse out params from the POST'd form. This provides a different way to collect data instead of relying on URL or query params.

`server.js`
```js
var express = require('express');
var bodyParser = require('body-parser');
var app = express();

// bodyParser.urlencoded() returns a function that will be called later in the app.post() route
var parseUrlencoded = bodyParser.urlencoded({extended: false});

// store for cities in memory (as long as server is running)
var cities = [];

app.get('/cities', function(req, res) {
  res.json({cities: cities});
})

// passing multiple middleware functions to this route; they are executed sequentially.
// NOTE does it matter what we call the request and response parameter for our callback?
app.post('/cities', parseUrlencoded, function (request, response) {
  //                ^- middleware -^
  var city;
  var name = request.body.name;
  var description = request.body.description;
  city = { name: name, description: description}
  cities.push(city);

  // sending json
  response.json({ cities: cities});
});
```

### Including middleware on all routes

Another way to include middleware is via `app.use`.  This will include it on *all* routes.

```js
var express = require('express');
var bodyParser = require('body-parser');
var app = express();

// store for cities in memory (as long as server is running)
var cities = [];

// body parser config for all routes
app.use(bodyParser.urlencoded({ extended: false }));
//    ^              middleware            ^

app.get('/cities', function(req, res) {
  res.json({cities: cities});
})

app.post('/cities', function (request, response) {
  var city;
  var name = request.body.name;
  var description = request.body.description;
  city = { name: name, description: description}
  cities.push(city);

  // sending json
  response.json({ cities: cities});
});

```

* Is there something missing from this code?
  * We haven't installed the `body-parser` package.
* What will the client see when it GETs /cities?
* How can we post to this?
  * postman
  * HTML form


  ```html
  <html>
  <body>
    <form method="POST" action="http://localhost:3000/cities">
      <label for"cityName">city</label>
      <input id="cityName" name="name" type="text" />
      <label for"cityDesc">description</label>
      <input id="cityDesc" name="description" type="text" />
      <input type="submit" />
    </form>
  </body>
  </html>
  ```

### Writing our own middleware

How can we write our own middleware?  Let's say we want to make some alteration to the params so that further down the chain those alterations can be used.  


```js
// call this function on every route with the param of 'name'
app.param('name', function(request, response, next) {
  // get name from params
  var name = request.params.name;
  // capitalize the name
  var capitalizedName = name[0].toUpperCase() + name.slice(1).toLowerCase();
  // set the value of the name to the capitalized version
  request.params.name = capitalizedName;
  // pass control to the next middleware function
  next();
})

app.get("/greet/:name", function (req, res) {
  res.send( "Hello, " + req.params.name );
});
```

Now every name is capitalized.

## Resources

1. [body-parser](https://github.com/expressjs/body-parser) on Github.
