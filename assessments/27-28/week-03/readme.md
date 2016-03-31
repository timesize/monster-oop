# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Week 3 Assessment

1. A user fills out a form and hits the "submit" button. List at least 3 things that will happen in the browser and/or server in the next few moments.

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

2. Give two examples of HTTP status codes and what they mean.

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

3. Fill in the following grid of RESTful Routes (assume that it’s for an ordering system):

  | CRUD Action | HTTP Verb (Method) | URL Path (Endpoint) |
  | :--- | :--- | :--- |
  | READ (all) |  |  |
  | CREATE |  | `/api/orders` |
  | READ (one) |  |  |
  | UPDATE | PATCH or PUT |  |
  | DELETE |  |  |

  <br>
  <br>
  <br>
  <br>
  <br>

4. Briefly describe the purpose of each of the following files/directories in our Express projects:

  **server.js**

  <br>
  <br>
  <br>
  <br>
  <br>

  **package.json**

  <br>
  <br>
  <br>
  <br>
  <br>

  **node_modules/**

  <br>
  <br>
  <br>
  <br>
  <br>

  **models/food_truck.js**

  <br>
  <br>
  <br>
  <br>
  <br>

  **public/scripts/app.js**

  <br>
  <br>
  <br>
  <br>
  <br>

  **views/index.html**

  <br>
  <br>
  <br>
  <br>
  <br>

5. Jimmy has an awesome Express app running his business at http://www.jimmysworld.com. Now Jimmy wants his site to include an API that exposes his employee's contact information to developers. For example, a request to `/api/employees/2` should respond with a JSON object containing the contact information for Suzy the Sales Manager (id, name, email address, title). Help Jimmy add a route to his server-side application code that responds with the desired data:

  app.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;, function (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;) {

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

  });

6. Sales of Dr. Fritz's Glorious Creature Classification Machine are through the roof. Now Dr. Fritz has a problem -- he doesn't know how to program the machine!

Given the following list of unknown creatures:

  ``` js
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

  ``` js
  classify(unknown_creatures);
  // ["Tetrapod", "Arachnid", "Jellyfish"]
  ```

**6.1**: Can you write a `classify` function that will correctly classify any array of creature data? Assume all the data will be for Tetrapods, Arachnids, or Jellyfish with the same features as those above. Return an array of classification strings in the correct order based on the input data.
  
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

**6.2 (Bonus)**: Dr. Fritz is pretty sure that there's no such thing as a creature with an odd number of eyes. Can you update the classification algorithm to output "Impossible" in that case?
