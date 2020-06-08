# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Instructions
​
1. Create a branch off of your Sweater Weather project called `final_assessment`.
1. As you work, you should commit to this branch **every 15 minutes**.
1. DO NOT push your code to your GitHub repo until the end of the 3 hour assessment
1. Complete the assignment below. You should:
    * TDD all of your work
    * Prioritize getting your code functional before attempting any refactors
    * Write/refactor your code to achieve good code quality
​
## Assignment
​
You will build an endpoint that will retrieve food and forecast information for a destination city.
​
Your endpoint should follow this format:
​
`GET /api/v1/foodie?start=denver,co&end=pueblo,co&search=italian`
​
Your API will return:
- the end city
- estimated travel time
- the name and address of a restaurant that matches the search parameter
- the forecast at your time of arrival
​
Your response should be similar to the format below:
​
```
{
  "data": {
    "id": "null",
    "type": "foodie",
    "attributes": {
      "end_location": "pueblo,co",
      "travel_time": "1 hours 48 min",
      "forecast": {
        "summary": "Cloudy with a chance of meatballs",
        "temperature": "83"
      },
      "restaurant": {
        "name": "Angelo's Pizza Parlor",
        "address": "105 E Riverwalk, Pueblo 81003"
      }
    }
  }
}
```
​
## APIs
​
You are required to consume the following APIs:
​
1. Google directions API
    - to find out how long it will take to travel from your start location to your end location.
    - https://developers.google.com/maps/documentation/directions/start
1. Zomato API
    - Use the search endpoint to search for the name and address of a restaurant in your end location
        - Restaurants should match the search parameter from the request
    - Documentation: https://developers.zomato.com/documentation#!/restaurant/search
        - **Note**: You can identify the end location using either lat/long coordinates or a Zomato `entity_id`
1. Open Weather Map API
    - to find the forecast in the end location at the time of arrival.
    - https://openweathermap.org/api










