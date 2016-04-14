# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular $http

| Objectives |
| :--- |
| Make requests to edit and delete data with `$http`. |


### Update Project

<details>
  <summary>**Update a project -- with an example `$http` request to `PUT /api/projects/4`.**</summary>
  ```js
  $http({
    method: 'PUT',
    url: baseUrl + '/api/projects/4',
    data: {
      name: 'Mentor new members of the Night\'s Watch',
      type: 'volunteering',
      // new opponents
      opponents: [ 'criminal backgrounds', 'lack of trust' ],
      status: 'ongoing'
    },
  }).then(function successCallback(response) {
    console.log('response for update project:', response);
  }, function errorCallback(error) {
    console.log('There was an error', error);
  });
  ```

  ... and a sample response:
  <details><summary>click to see full response</summary>
  ```js
  {
    "data": {
      _id: 4,
      name: "Mentor new members of the Night's Watch",
      type: "volunteering",
      opponents: [ "criminal backgrounds", "lack of trust" ],
      status: "ongoing"
    },
    "status": 200,
    "config": {
      "method": "PUT",
      "transformRequest": [
        null
      ],
      "transformResponse": [
        null
      ],
      "data": {
        name: "Mentor new members of the Night's Watch",
        type: "volunteering",
        opponents: [ "criminal backgrounds", "lack of trust" ],
        status: "ongoing"
      },
      "url": "http://www.jonsnow-portfolio.com/api/projects/4",
      "headers": {
        "Accept": "application/json, text/plain, */*"
      }
    },
    "statusText": "OK"
  }
  ```  
  </details>

</details>


### Delete Project

<details>
  <summary>**Delete a project -- with an example `$http` request to `DELETE /api/projects/4`.**</summary>
  ```js
  $http({
    method: 'DELETE',
    url: baseUrl + '/api/projects/4',
  }).then(function successCallback(response) {
    console.log('response for delete project:', response);
  }, function errorCallback(error) {
    console.log('There was an error', error);
  });
  ```

  ... and a sample response:
  <details><summary>click to see full response</summary>
  ```js
  {
    "data": {
      _id: 4,
      name: "Mentor new members of the Night's Watch",
      type: "volunteering",
      opponents: [ "criminal backgrounds", "lack of trust" ],
      status: "ongoing"
    },
    "status": 200,
    "config": {
      "method": "DELETE",
      "transformRequest": [
        null
      ],
      "transformResponse": [
        null
      ],
      "url": "http://www.jonsnow-portfolio.com/api/projects/4",
      "headers": {
        "Accept": "application/json, text/plain, */*"
      }
    },
    "statusText": "OK"
  }
  ```  
  </details>

</details>
