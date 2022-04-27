<div align="center">


# WELCOME TO SWEATER WEATHER
![alt text](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iRZS-IM5zL8H5VjKhjVV1odwY2jjOj_pvg&usqp=CAU)



  ## Table of Contents

  ### [Getting Started :runner:](#getting-started)
  ### [Calling Endpoints :telephone_receiver:](#calling-endpoints)
  ### [Important Information :warning:](#important-information)
  ### [Collaboration :handshake:](#collaboration)
  ### [Built With :hammer_and_wrench:](#built-with)

  


# GETTING STARTED
  This application is meant to be used either individually using [<img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/>](https://learning.postman.com/docs/getting-started/introduction/) or in conjunction with a Front End application. If using a front end application, all end points should provide sufficient data to renders views and a functional user interface. To see possible wire frames for what a FE application may look like using this data - [Click Here :computer_mouse:](#frontend)
  
<div align="left">
 :one: Fork and clone this repo <br><br>
 :two: Install gems locally via <b>bundle install</b> from CL <br><br>
 :three: Reset database via <b>rails db:{drop,create,migrate} </b> from CL <br><br>
 :four: Start server via <b>rails s </b> from CL <br><br> 
 :five: Call endpoints in FE application or in Postman <br>
</div>
  
# CALLING ENDPOINTS
  
 ## Retrieve weather for a city
</div>
<div align="left">
  
  ```ruby  
  GET /api/v1/forecast?location=denver,co
  Content-Type: application/json
  Accept: application/json
  ```
   ### Response
  ```json  
  {
    "data": {
      "id": null,
      "type": "forecast",
      "attributes": {
        "current_weather": {
          "datetime": "2020-09-30 13:27:03 -0600",
          "temperature": 79.4,
          etc
        },
        "daily_weather": [
          {
            "date": "2020-10-01",
            "sunrise": "2020-10-01 06:10:43 -0600",
            etc
          },
          {...} etc
        ],
        "hourly_weather": [
          {
            "time": "14:00:00",
            "conditions": "cloudy with a chance of meatballs",
            etc
          },
          {...} etc
        ]
      }
    }
  }
  ```
</div>
  
# IMPORTANT INFORMATION

 ### Ruby version 2.7.4
 ### Rails version 5.2.7
  In order to effectively call API endpoints, a few API keys will need to be obtained from third party APIs. Assuming 'bundle install' was ran as instructed in "Getting Started", the Figaro gem should be ready to go. Simply run 'bundle exec figaro install' from the CL to create an application yml file. This is where you will store the following keys from the following API's: 
<div align="left">
 
[Map Quest's GeoCoding API](https://developer.mapquest.com/documentation/geocoding-api/) <br> 
[OpenWeather One Call API ](https://openweathermap.org/api/one-call-api) <br>
[Pexels Photo API](https://www.pexels.com/api/)

 ### After obtaining keys, your application.yml file should look like this :arrow_down:
```ruby  
open_weather_key: <YOUR KEY HERE >
map_quest_key: <YOUR KEY HERE >
pexels_key: <YOUR KEY HERE >
```
  
</div>
  
# COLLABORATION
  
# BUILT WITH
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />  <img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" />  <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"/> <img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white" /> <img src="https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white" /> <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white" /> <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />      
  
#### :gem: Additional Gems :gem:
Capybara |
Fast JSON API |
Faraday |
VCR |
Webmock |
Shoulda Matchers |
SimpleCov |
Figaro |
  
</div>
  
# FRONTEND
  
