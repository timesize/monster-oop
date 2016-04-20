![GA Logo](https://raw.github.com/generalassembly/ga-ruby-on-rails-for-devs/master/images/ga.png)

## Angular Movie API Integration

| Objectives |
| :--- |
| Create a single page Angular app from scratch. |
| Make requests to an external API and display the results in a presentable format. |
| Separate appropriate functionality into services and directives.  |


#### Specs

- The page should have a form that uses the [OMDB api](http://www.omdbapi.com/) to search for matching movies and then display the results.
 - *Example*: If a user searches for `Star Wars`, a card for each Star Wars movie result will be displayed.

- The card display of each movie should include a poster image, the movie title, and the year of release. The display of cards should be responsive and use Bootstrap.

- When the user clicks on a search result, go to a show page for that movie.
  - *Example*: If a user is viewing a list of every Star Wars movie and clicks on `Star Wars: A New Hope`, you will navigate to a show view with a single movie card.

- Once you have basic API functionality, you should abstract all of the access to the [OMDB api](http://www.omdbapi.com/) into a custom service called `MovieService`. You should be able to ask the `MovieService` to get search results and to get one single movie.

- Once you have basic display working, you should abstract the card away into a directive called `wdiMovieCard` that takes in a movie object to display.
