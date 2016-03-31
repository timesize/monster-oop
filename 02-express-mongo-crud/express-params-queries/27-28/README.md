# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Intro to Express continued:

## Routes, Params, and Queries

| Objectives |
| :---- |
| Explain parsing URL params and using query string params. |
| Apply routing knowledge to build an Express application with dynamic routes. |
| Understand POST and how it is used to instruct the server to save data. |

## Pre-reading

* [HTTP Intro](http://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177)

## Terminology

* HTTP
* Resource path
* Query string
* HTTP verb
  * POST
* Status code
* Middleware


## Outline

* Intro (continued) to Express
* Routing
  * HTTP GET
  * Request Params
* Query Params
  * Middleware

## What Can We Do with Express?

* Server-side JS
  * Instead of DOM manipulation, we are interacting with the request / response cycle
* (B.Y.O.A.) Build your own API

### Setup

Let's start with a simple **Express** application.

* Make a directory and `server.js`

  ```bash
  mkdir quick_example
  cd quick_example/
  touch server.js
  ```

* Then create a `package.json`.

  ```bash
  npm init
  npm install --save express
  atom .
  ```
The folder structure will be as follows:

**What just happpened?**
NPM (Node Package Manager) keeps track of the various libraries and third-party packages of code that we use.  In the above instance, `npm init` initializes a JSON file that stores important information about our project.  `npm install --save express` tells the Node Package Manager to dowload and install the Express library for this particular project.  the `--save` flag lets NPM know that we will be downloading and using `express` only for this project.  The above two `npm` commands will be called every time you create a new web application using express.  You will install other packages as we introduce them in such a manner.

```
quick_example
  ├── node_modules/
      └── express/
  ├── server.js  
  ├── package.json
  ...
```

Now we need to write some code for our simple application.

`server.js`
```js
// requirements
var express = require('express'),
    app = express();

// a "GET" request to "/" will run the function below
app.get("/", function (req, res) {
  // send back the response: 'Hello World'
  res.send("Hello World");
});

// start the server
app.listen(3000, function () {
  console.log("Go to localhost:3000/");
});

```

Now you can start the server:

```bash
node server.js
```

## What is Routing?

Building an application will require us to have a firm grasp of something we call **routing**.  Each **route** is a combination of a **Request Type** and **Path**.

| Request Type | Request Path | Response
| :--- | :--- | :--- |
| `GET` | `/` | `Hello World` |
| `GET` | `/api/burgers` | `Hamburger`, `Cheese Burger`, `Dble Cheese Burger` |
| `GET` | `/api/tacos` | `Soft Taco`, `Crunchy Taco`, `Super Taco` |


Let's build these into our application:

`server.js`
```js
var express = require('express'),
  app = express();

var burgers = [
  "Hamburger",
  "Cheese Burger",
  "Dble Cheese Burger"
];

var tacos = [
  "Soft Taco",
  "Crunchy Taco",
  "Super Taco"
];

app.get("/", function (req, res) {
  res.send("Hello World");
});

app.get("/api/burgers", function (req, res) {
  //send all the burgers     
  res.send(burgers.join(", "));
});

app.get("/api/tacos", function (req, res) {
  //send all the tacos       
  res.send(tacos.join(", "));
});

app.listen(3000, function () {
  console.log("Go to localhost:3000");
});

```

## Request (URL) Parameters

What if we want to create an app that can dynamically say hello to anyone?

* Using **url parameters** add a dynamic route to the application, indicated by `:` and the variable name you want to use, we'll use `:name` for the example below.

```js
app.get("/greet/:name", function (req, res) {
  res.send( "Hello, " + req.params.name );
});
```

Here we are seeing the first introduction to parameters that the application can identify. In the following route `:name` is considered a route parameter. We can access it using `req.params.name`.

| Request Type | Request Path | Response
| :--- | :--- | :--- |
| `GET` | `/greet/:name` | `Hello, :name` |


## Query Parameters

Generally, you don't want to cram everything into a route. Just imagine when there are multiple parameters in a route. Or maybe we don't care about getting the order of the parameters correct. Luckily, there are **query parameters** you can include with each request.

Let's see query params in action. Go to <a href="https://google.com/search?q=kittens&tbm=isch" target="_blank">https://google.com/search?q=kittens&tbm=isch</a>

* `?` denotes the beginning of the query parameters.
* `=` indicates a key-value-pair assignment; anything to the left is the key, while the right represents the value.
* `&` allows for the input of multiple parameters, separating each parameter.

Let's add our first route to practice query params.

```js
app.get("/thank", function (req, res) {
  var name = req.query.name;
  res.send("Thank you, " + name);
});
```

Reset your server and go to <a href="localhost:3000/thank?name=jane" target="_blank">localhost:3000/thank?name=jane</a>. Note how we can now define parameters in the url after a `?`.

## Choosing between request params and query params

* **request params:** `http://localhost:3000/icecream/:flavor`

* **query params:** `http://localhost:3000/icecream?flavor=SOMEFLAVOR`

Generally if the parameter is identifying a specific _entity_ or _resource_ on it's own, you most likely want request params.  If it is an optional param for this route, you generally should use query params.

Common cases for **Request Params**:
* **database/item IDs**            -  GET `/contacts/348`
* **major components of the app**  -  GET `/posts/33`
  * resources!
* **expressing hierarchies**       -  GET `/departments/44/employees/2`

> Request Params are not always IDs either; names can be used in some systems: `/departments/accounting/employees/LiuJanice`

Common cases for **Query Params**:
* **searches**             -  GET `/?q=kittens`
* **optional selections**  -  GET `/calculator?lang=en`
* **pagination**           -  GET `/posts?start=1&size=10`
* **other limits**         -  GET `/posts?since=2015-11-29`

Finally you might use them both together in some cases: `/posts/33/comments?limit=50`

## POST

Up until now we've used (the HTTP verb) GET to retrieve data from APIs.  
_But what if we want to let our users store data?_
When one wants to store data - or **create new resources** on a server, the standard is to use the HTTP verb POST.

You can use POST directly from an HTML form:

```html
<html>
<body>
  <form method="POST" action="http://localhost:3000/api/cities">
    <label for"cityName">city</label>
    <input id="cityName" name="name" type="text" />
    <label for"cityDesc">description</label>
    <input id="cityDesc" name="description" type="text" />
    <input type="submit" />
  </form>
</body>
</html>
```

Or with AJAX:

```js
// app.js
$.ajax({
  method: "POST",
  url: "https://localhost:3000/api/cities",
  data: {
    name: "City of Oz",
    description: "Capitol city of the Land of Oz and seat of the ruling wizard of Oz",
  },
  success: function handleCityCreateResponse(data) {
    console.log("city was successfully created!")
    console.log("the name of the new city entered is ", data.name)
    // render book to page
  },
  error: function handleErrorCityCreateResponse() {
    console.error("uh oh... failed to create")
  }
});
```


In our Express server we'll use `app.post` rather than `app.get` to handle `POST` requests.  We can have both an `app.get` and an `app.post` that use the same route; Express will call the correct callback based on the HTTP verb.  
In other words, **both the request-type and request-path must match**.

```js
// server.js
app.post('/cities', function citiesCreate(req, res) { // save the posted data
```

### RESTful routing introduction

Let's look at some routes for the cities **resource**.  

| HTTP Verb | Route       | RESTful description | Purpose |
| :-------- | ----------- | ------------------- | --------------------|
| GET       | /api/cities     | citiesIndex         | Listing all cities. |
| GET       | /api/cities/:id | citiesShow          | Details of one city. |
| POST      | /api/cities     | citiesCreate        | Create a new city.

**REST** combines an **HTTP verb**, with an **endpoint** (route) in a standard way to make working with **resources** easier across the web.  We'll talk more about this, and it'll become very important in the next few days.  :eyes:



### Middleware and body-parser

Middleware allows us to make changes to the request or response objects; injecting code before the actual route handler.

POST requests don't use query-parameters like GET requests do.  Instead they submit data in the body of the request.  We'll use middleware called **body-parser** to help us parse and make-use-of that data.

You can add the body-parser middleware to your app by:  
1. Installing the body parser module `npm install --save body-parser`  
2. Including the middleware in the app using `app.use`.


```js
app.use(bodyParser.urlencoded({ extended: false }));
```

In any routes receiving post data you can now access that data using `req.body`.

```js
app.post('/api/cities', function citiesCreate(req, res) {
  var name = req.body.name;
  var desc = req.body.description;
  var newCity = { name: name, description: desc };
  // assuming that cities is an array in our app:
  cities.push(newCity);
  res.json(cities);
});
```

You can [read more about middleware here](middleware_reading.md).

> Note: for most of our Express apps we'll just include bodyParser as part of the _boiler-plate_ of the app.


## Summary

We learned about:

* Routing to different resources, i.e. `/api/burgers` and `/api/tacos`.
* Using dynamic parameters, i.e. `/api/burgers/:index` and `/api/tacos/:index` to request specific data.
* Using query parameters for dynamic requests to serve up dynamic responses.
* Using POST to send data to our Express app.

This will be essential knowledge for building and interacting with applications that contain multiple resources, such as users, posts, comments, etc.


## Resources

1. <a href="http://expressjs.com/starter/installing.html" target="_blank">Starting an Express Project</a>
2. <a href="http://expressjs.com/starter/hello-world.html" target="_blank">Express Hello World</a>
3. <a href="http://expressjs.com/starter/basic-routing.html" target="_blank">Express Basic Routing</a>
