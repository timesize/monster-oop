# Exercises

### Setup

Create a simple node app with express, body-parser, and mongoose packages, or start with your code from a previous project.

### Base Exercises

1. Assemble the code in this module's README into your project and refactor it to create your own models that use referenced documents. Don't use games and consoles.
1. Make a seed.js file in which you:  
  1. Create at least 5 'top-level' documents (in my case, five games) and at least 3 referenced documents (in my case, three consoles).  
  1. Log each top-level documents with just ObjectIds for the referenced documents.
  1. Finally, call `populate()` on a query and demonstrate the **full** referenced documents, as shown in the README with the Legend of Zelda: Ocarina of Time and the Nintendo 64.  
1. Incorporate your work into the server routes to show and create each type of resource. Test your routes with postman.

### Stretch Exercises

1. Move beyond show and create - make and fill in the rest of the RESTful routes for each resource.  
1. Make and fill in RESTful routes for nested resources (see the store/item example in the readme).

### Tips:

* Use `.remove` or `.findOneAndRemove` to delete your old data if your database gets cluttered.
