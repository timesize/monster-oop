# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Week 3 Assessment [SOLUTIONS]

1. A user fills out a form and hits "submit". List at least 3 things that might happen next.

  * The submit event fires
   * If jQuery is listening for the "submit" event, generally the "preventDefault" method will be used to stop the form from submitting so that it can be manually submitted ("in the background") using AJAX.
  * The form inputs are gathered into a urlencoded parameter string of key value pairs.
   * If the HTML form or AJAX request specified a method of 'get' the query parameter string is placed directly in the URL of the request
   * If the HTML form or AJAX specified a method of 'post' the urlencoded form data is placed inside the body of the request
  * An HTTP Request is sent to the server using the current host and the specified endpoint (e.g. http://www.example.com/api/books).
  * The server looks for a route that matches the request
  * If a matching route is not found, the server should respond with status code 404 (Not Found).
  * If a route is found, the server process the request parameters and request body. Generally this data is then saved/persisted to a database.
  * Once that data has been successfully saved, the server responds:
   * If the form was submitted without using AJAX, the PRG (POST, Redirect, GET) convention says to send a 302 (Redirect) back to the browser to whatever page makes sense for the user to see (GET) next.
   * If the form was submitted using AJAX, the response should generally be JSON and should contain the newly created record including (importantly) the newly assigned id of that record.
    * When the client/browser receives the HTTP Response and response json, the success callback is executed.

2. Give two examples of HTTP status codes and what they mean.

  * 200 - ok
  * 201 - created
  * 301 - moved permanently
  * 302 - found
  * 400 - bad request
  * 401 - unauthorized
  * 404 - not found
  * 422 - unprocessable entity
  * 500 - internal server error
  * 502 - bad gateway

3. Fill in the following grid (assume that it’s for an ordering system):

  | CRUD Action | HTTP Verb (Method) | URL Path (Endpoint) |
  | :--- | :--- | :--- |
  | READ (all) | GET | `/api/orders` |
  | CREATE | POST | `/api/orders` |
  | READ (one) | GET | `/api/orders/:id` |
  | UPDATE | PATCH or PUT | `/api/orders/:id` |
  | DELETE | DELETE | `/api/orders/:id` |

4. Briefly describe the purpose of each of the following files/directories in our Express projects:

  **server.js** - set up server and routes

  **package.json** - list dependencies (node modules) we're using in our app (allows anyone to clone the project and run `npm install`)

  **node_modules/** - folder containing dependencies (node modules) we're using in our app
  
  **models/food_truck.js**  - the mongoose schema and model for a FoodTruck. This allows us to query the database for food truck records, and perform CRUD actions on food trucks.

  **public/js/main.js** - client-side JavaScript file where we use AJAX to query our API

  **views/index.html** - view for our homepage, may also include some client-side templating (handlebars).

5. Jimmy has an awesome Node/Express app running his site at http://www.jimmysworld.com. Now Jimmy wants his site to include an API that exposes his contact information to developers. His `/api/employees/2` endpoint should respond with a JSON object containing his name, phone number, and email address. Help Jimmy add a route to his server-side application code that responds with the desired data:

  ```js
  // good
  app.get('/api/employees/:id', function (req, res) {
    db.Employee.findOneById(req.params.id, function(err, employee){
     if (err || !employee){
       return res.statusCode(404);
     }
     res.json(employee);
    })
  });
  
  // not too shabby
  app.get('/api/employees/2', function (req, res) {
     var employee = {
      name: 'Suzy',
      title: 'Sales Manager',
      emailAddress: 'suzy@jimmysworld.com'
     }
     res.json(employee)
  });

  ```

6. Sales of Dr. Fritz's Glorious Creature Classification Machine are through the roof. Now Dr. Fritz has a problem -- he doesn't know how to program the machine!

Given the following list of unknown creatures:

  ```
  var unknown_creatures = [
    {
      appendages: 4,
      eyes: 2,
      isSoggy: true
    },
    {
      appendages: 8,
      eyes: 4,
      isSoggy: false
    },
    {
      appendages: 60,
      eyes: 24,
      isSoggy: true
    }
  ];
  ```

Dr. Fritz can tell the creatures (above) are a Tetrapod, an Arachnid, and a Jellyfish (He's an expert!). But he needs for his machine to produce the following readout (an array of strings): 

  ```
  classify(unknown_creatures);
  // ["Tetrapod", "Arachnid", "Jellyfish"]
  ```

**6.1**: Can you write a `classify` function that will correctly classify any array of creature data? Assume all the data will be for Tetrapods, Arachnids, or Jellyfish with the same features as those above. Return an array of classification strings in the correct order based on the input data.

```js
// good
function classify(creatures){
   var classification_by_appendage_count = {
      4: "Tetrapod",
      8: "Arachnid",
      60: "Jellyfish"
   };
   var output = creatures.map(function(creature){
    return classification_by_appendage_count[creature.appendages] || "Unknown";
   });
   
   return output;
}

// ok
function classify(creatures){
  var output = [];
  for(var i=0; i<creatures.length; i++){
    var creature = creatures[i];
    if (creature.appendages === 4){
      output.push("Tetrapod");
    } else if (creature.appendages === 8) {
      output.push("Arachnid");
    } else if (creature.appendages === 60) {
      output.push("Jellyfish");
    } else {
      output.push("Unknown");
    }
  }
  return output;
}
```


**Bonus**: Dr. Fritz is pretty sure that there's no such thing as a creature with an odd number of eyes. Can you update the classification algorithm to output "Impossible" in that case?

```js
function classify(creatures){
   var classification_by_appendage_count = {
      4: "Tetrapod",
      8: "Arachnid",
      60: "Jellyfish"
   };

   var output = creatures.map(function(creature){
    if (creature.eyes % 2 !== 0){
     return "Impossible";
    }
    return classification_by_appendage_count[creature.appendages];
   });
   
   return output;
}
```

