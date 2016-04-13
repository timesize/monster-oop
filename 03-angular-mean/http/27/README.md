# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular $http

| Objectives |
| :--- |
| Make API requests with `$http`. |
| Send form data with requests. |
| Send query string parameters with requests. |

## Angular `$http`

![Docs](https://cloud.githubusercontent.com/assets/1329385/12429176/b05c7eea-be9d-11e5-8da4-18b968e8cd72.gif)

We **should** know jQuery's `$.ajax` by now.

<details>
  <summary>What does this method do?</summary>

  It makes HTTP calls asynchronously from our browser and allows us to request information over HTTP without interrupting the front-end or causing page reloads.
</details>

In our projects, we've used this method often, and we've seen the `$.get` and `$.post` shorthand versions. Angular has a stand-in for `$.ajax`, called `$http`.

`$http` is an Angular service.


We can use `$http` from directly within a controller, so we'll try that to get started. When we talk more about services, we'll look at another option.

Let's look at an example of how `$http` is used and walk over the separate components.

[Echo App](https://jsfiddle.net/9L7wae3g/)

You must be able to answer these questions.

* Where is `echoApp` defined?
* What is the name of the `ng-app` used on this page?
* Where is `EchoController` defined?
* What is the name of the `ng-controller` used on the page?
* How did we inject (include) required libraries for a controller?
* How did we make a GET request to an API?
* How did we set the API's URL?
* How did we send query parameters to the API?
* How did we send data to the API?
* Where is the success callback defined?
* How do we use promises in our code?
* Where is the error callback defined?
* How do we set `results` to be the response from an API?
* What part of the response carries the data the API sent back?

## CRUD operations with `$http`


Here are a few examples of how we'd use `$http` to access an API that describes a man named Jon Snow and his projects. Let's assume the base URL is `http://www.jonsnow-portfolio.com`, and that Jon has his site configured to allow cross-origin requests. (Just like with `$.ajax`, we can leave this part out when we're serving our front-end from the same computer as our back-end.)

#### Projects Index

<details>
  <summary><h4>Get all projects with an `$http` request to `GET /api/projects`.</h4></summary>
  ```js
  $http({
    method: 'GET',
    url: baseUrl + '/api/projects'
  }).then(function successCallback(response) {
    // what is vm? remember we're in a controller
    vm.projects = response.data;
  }, function errorCallback(error) {
    console.log('There was an error getting the data', error);
  });
  ```

  ... and a sample response:
  <details><summary>click to see full response</summary>
  ```js
  {
    "data": {
      [
         {
            _id: 2,
            name: 'Defeat the wildlings',
            type: 'quest',
            opponents: [ 'Mance Rayder', 'Lord of Bones'],
            status: 'resolved'
         },
         {
            _id: 3,
            name: 'Save the wildlings',
            type: 'campaign',
            opponents: ['the Night Watch', 'the Others'],
            status: 'pending'
         }
      ]
    },
    "status": 200,
    "config": {
      "method": "GET",
      "transformRequest": [
        null
      ],
      "transformResponse": [
        null
      ],
      "url": "http://www.jonsnow-portfolio.com/api/projects/",
      "headers": {
        "Accept": "application/json, text/plain, */*"
      }
    },
    "statusText": "OK"
  }
  ```  
  </details>

</details>


Projects Index

```
JSON API Endpoint           Response JSON
=============               =============

GET /api/profile            {
                              name: "Jon Snow",
                              github_link: "http://github.com/u-know-nothing-jon-snow",
                              current_city: "The Wall",
                              is_awake: false,
                              family_members: [
                                { name: 'Arya Stark', relationship: 'sister' },
                                { name: 'Bran Stark', relationship: 'brother' }
                              ]
                            }

GET /api/projects           [
                             {
                                _id: 2,
                                name: 'Defeat the wildlings',
                                type: 'quest',
                                opponents: [ 'Mance Rayder', 'Lord of Bones'],
                                status: 'resolved'
                             },
                             {
                                _id: 3,
                                name: 'Save the wildlings',
                                type: 'campaign',
                                opponents: ['the Night Watch', 'the Others'],
                                status: 'pending'
                             }
                            ]

GET /api/projects?limit=1   [ { _id: 2, name:'Defeat...' } ]

GET /api/projects?status=pending
                            [ { _id: 3, name:'Save...' } ]                                
GET /api/projects/2         { _id: 2, name:'Defeat...' }

POST /api/projects          etc
PUT /api/projects/2         etc
DELETE /api/projects/2      etc
```


## Your Turn

We've gone over how to work with remote servers using Angular. Now it is your turn to connect an angular front-end to an API.  Start Tunely Sprint 2!
