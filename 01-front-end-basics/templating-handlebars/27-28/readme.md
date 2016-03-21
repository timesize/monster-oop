# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Handlebars Templating

| Objectives |
| :--- |
| Add the Handlebars.js library to your projects |
| Create and compile a Handlebars template |
| Use Handlebars templating to display data from an AJAX call on your HTML page |

## What is a template?

* A **template** is a document (or piece of code) that contains **parameters** that are dynamically replaced with data.

* Thus far, we've been using jQuery to append HTML strings when we have data to send to the view from a server (via AJAX).

* To avoid building long strings of HTML every time we have data to send to the view, we'll use <a href="http://handlebarsjs.com" target="_blank">Handlebars templating</a>. This will allow us to dynamically display data in our HTML. The parameters for our data will live inside `{{}}` tags.

## Why use client-side templating?

* Separate markup from logic. Remember this?

  ```js
  var trackHtml = '<p><strong>' + trackData.name + '</strong> by ' + trackData.artist + '</p>';
  $results.append(trackHtml);
  ```

  * When appending new HTML elements to the page, the string of elements to append will only get longer as you begin to write more complex markup.
  * Wouldn't it be nice if the HTML structure was already set up for us? That's where templating comes in!

* Maximize code reusability and maintainability.

  * If you need to change your HTML structure for elements you're creating and displaying (e.g. adding an additional class name to your Spotify tracks), all you have to do is change the template!

## Handlebars Setup

1. Add the Handlebars CDN to your `index.html` (remember you can go to <a href="https://cdnjs.com" target="_blank">cdnjs</a> to search for CDNs). Make sure to require Handlebars before your custom script file.

  ```html
  
  <!DOCTYPE html>
  <html>
    <head>
      <!--title, meta tags, styles, etc. -->
      
      <!-- jquery -->
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  
      <!-- handlebars -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.3/handlebars.min.js"></script>
  
      <!-- custom script -->
      <script type="text/javascript" src="main.js"></script>
    </head>
    <body>
      <div class="container">
        <!-- page content -->
      </div>
    </body>
  </html>
  ```

2. Next create an element in your `index.html` where you will append the data from your template. Give this element an `id` (e.g. `results`) so you can select it very specifically with jQuery.

  ```html
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div id="results"></div>
        </div>
      </div>
    </div>
  </body>
  ```

3. Create the template inside your `results` element. Give your template an `id` (e.g. `tracks-template`) so you can select it with jQuery. This template acts as an HTML "mad lib" which you'll fill with data. The `{{}}` parameters will be replaced by the data that comes back from your API call.

  ```html
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div id="results">

            <!-- handlebars template -->
            <script id="tracks-template" type="text/x-handlebars-template">
              {{#each tracks}}
                <p><strong>{{name}}</strong> by {{artists.[0].name}}</p>
              {{/each}}
            </script>

          </div>
        </div>
      </div>
    </div>
  </body>
  ```

  **Note:** The example above uses the Spotify API. We use `{{each}}` to iterate through the tracks that come back from Spotify. Each track has a `name` and an array of `artists`. Notice the extra `.` we need when accessing a value from an array (this syntax is specific to Handlebars). `artists.[0]` gives us the first artist from the array.

4. Compile your template in `js/app.js`. Handlebars has a function called `Handlebars.compile(source)`. The source is takes in is the html from inside your template script. Handlebars' `compile` function returns a function, which we'll save to a variable called `template`. This isn't a special varible name; it just reminds us what the function does. Later, we'll use the `template` function to  pass in data to render in the template part of the page.

  ```js
  // compile handlebars template
  var source = $('#tracks-template').html();
  var template = Handlebars.compile(source);
  ```

5. On success of your AJAX call, pass the data that comes back from the API into your template function. The output of the template function is HTML that contains the data from the API. The last step is to append the HTML to the view.

  ```js
  $.get(searchUrl, );
  
  $.ajax({
    url: searchUrl,
    type: "GET",
    dataType : "json",
    success: renderTracks,
    error: handleTracksIndexError
  });

  function renderTracks(json) {

    // track results are acutally in an array called `items`
    // which is nested in the `tracks` object
    var trackResults = json.tracks.items;

    // pass in data to render in the template
    var trackHtml = template({ tracks: trackResults });

    // append html to the view
    $results.append(trackHtml);
  }
  
  function handleTracksIndexError(json){
    console.log("Error!");
  }
  ```

<!--## Challenges-->

<!--@TODO: BAD LINKS-->

<!--* Refactor your <a href="https:// github.com/sf-wdi-24/spotify-search" target="_blank">Spotify Search app</a> to use Handlebars templating. Feel free to pull down the <a href="https ://github.com/sf-wdi-24/spotify-search/tree/solution" target="_blank">solution branch</a> if you want to start with fresh code.-->


## Resources

* <a href="http://handlebarsjs.com" target="_blank">Handlebars.js</a>
