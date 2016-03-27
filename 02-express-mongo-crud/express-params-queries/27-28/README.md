# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Intro to Express continued:

## Routes, Params, and Queries

| Objectives |
| :---- |
| Explain parsing URL params and using query string params. |
| Apply routing knowledge to build an Express application with dynamic routes. |
| Explain the usefulness of middleware (e.g., `body-parser`). |

## Pre-reading

* [HTTP Intro](http://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177)

## Terminology

* HTTP
* Resource path
* Query string
* HTTP verb
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
// NOTE anyone know how we can better comment this code? *cough* jsdoc *cough*
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
| `GET` | `/burgers` | `Hamburger`, `Cheese Burger`, `Dble Cheese Burger` |
| `GET` | `/tacos` | `Soft Taco`, `Crunchy Taco`, `Super Taco` |


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

app.get("/burgers", function (req, res) {
  //send all the burgers     
  res.send(burgers.join(", "));
});

app.get("/tacos", function (req, res) {
  //send all the tacos       
  res.send(tacos.join(", "));
});

app.listen(3000, function () {
  console.log("Go to localhost:3000/");
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

Generally, you don't want to cram everything into a route. Just imagine when there are multiple parameters in route. Or maybe we don't care about getting the order of the parameters correct. Luckily, there are **query parameters** you can include with each request.

Let's see query params in action. Go to <a href="https://google.com/search?q=kittens&tbm=isch" target="_blank">https://google.com/search?q=kittens&tbm=isch</a>

* `?` denotes the beginning of the query parameters.
* `=` indicates an assignment; anything to the left is the key, while the right represents the value.
* `&` allows for the input of multiple parameters, separating each.

Let's add our first route to practice query params.

```js
app.get("/thank", function (req, res) {
  var name = req.query.name;
  res.send("Thank you, " + name);
});
```

Reset your server and go to <a href="localhost:3000/thank?name=jane" target="_blank">localhost:3000/thank?name=jane</a>. Note how we can now define parameters in the url after a `?`.

## Choosing between request params and query params

* **request params:** `http://localhost:3000/icecream/flavors/:flavor`

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



## Summary

We learned about:

* Routing to different resources, i.e. `/burgers` and `/tacos`.
* Using dynamic parameters, i.e. `/burgers/:index` and `/tacos/:index` to request specific data.
* Using query parameters for dynamic requests to serve up dynamic responses.
* Using POST to send data to our Express app.

This will be essential knowledge for building and interacting with applications that contain multiple resources, such as users, posts, comments, etc.


## Resources

1. <a href="http://expressjs.com/starter/installing.html" target="_blank">Starting an Express Project</a>
2. <a href="http://expressjs.com/starter/hello-world.html" target="_blank">Express Hello World</a>
3. <a href="http://expressjs.com/starter/basic-routing.html" target="_blank">Express Basic Routing</a>
