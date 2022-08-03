<div align="center">


# WELCOME TO SWEATER WEATHER


![image](https://user-images.githubusercontent.com/87443686/180871931-a161ebf1-a229-4c5e-84dd-8e7c6c6bd3f5.png)
<br>

### *An API server side application that provides users the ability to plan trips with other users while estimating travel time and retrieving weather forecast upon arrival*


<br>

  ## Table of Contents

  ### [Getting Started :runner:](#getting-started)
  ### [Important Information :warning:](#important-information)
  ### [Calling Endpoints :telephone_receiver:](#calling-endpoints)
  #### [V1](#version-one)
  #### [V2](#version-two)
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

  
 # CALLING ENDPOINTS
 # Version One 
 
 V1 endpoints do not require an account. No user information or authentication token is needed to call the following end points. 
 
<div align="center">
 <h2> Retrieve weather for a city <h2>
</div>
</div>
<div align="left">
  
  ```ruby  
  GET /api/v1/forecast?location=keywest, fl
  Content-Type: application/json
  Accept: application/json
  ```
   ### Response
  ```json  
{
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-04-27T11:38:05.000-04:00",
                "sunrise": "2022-04-27T06:54:52.000-04:00",
                "sunset": "2022-04-27T19:54:22.000-04:00",
                "temp": 82.49,
                "feels_like": 85.98,
                "humidity": 64,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2022-04-27",
                    "sunrise": "2022-04-27T06:54:52.000-04:00",
                    "sunset": "2022-04-27T19:54:22.000-04:00",
                    "max_temp": 82.49,
                    "min_temp": 76.41,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2022-04-28",
                    "sunrise": "2022-04-28T06:54:07.000-04:00",
                    "sunset": "2022-04-28T19:54:51.000-04:00",
                    "max_temp": 77.52,
                    "min_temp": 76.75,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-04-29",
                    "sunrise": "2022-04-29T06:53:22.000-04:00",
                    "sunset": "2022-04-29T19:55:21.000-04:00",
                    "max_temp": 77.52,
                    "min_temp": 76.82,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-04-30",
                    "sunrise": "2022-04-30T06:52:38.000-04:00",
                    "sunset": "2022-04-30T19:55:50.000-04:00",
                    "max_temp": 78.13,
                    "min_temp": 77.14,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-05-01",
                    "sunrise": "2022-05-01T06:51:55.000-04:00",
                    "sunset": "2022-05-01T19:56:20.000-04:00",
                    "max_temp": 78.28,
                    "min_temp": 77.45,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "11:00:00",
                    "temperature": 81.45,
                    "min_temp": 81.45,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "12:00:00",
                    "temperature": 82.49,
                    "min_temp": 82.49,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "time": "13:00:00",
                    "temperature": 81.5,
                    "min_temp": 81.5,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "14:00:00",
                    "temperature": 80.55,
                    "min_temp": 80.55,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "15:00:00",
                    "temperature": 79.59,
                    "min_temp": 79.59,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "16:00:00",
                    "temperature": 78.6,
                    "min_temp": 78.6,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "17:00:00",
                    "temperature": 77.7,
                    "min_temp": 77.7,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "18:00:00",
                    "temperature": 77.72,
                    "min_temp": 77.72,
                    "conditions": "broken clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
  ```
</div>
<div align="center">
 <h2> Retrieve image for a city <h2>
</div>
<div align="left">
  
  ```ruby  
  GET /api/v1/backgrounds?location=san diego, ca
  Content-Type: application/json
  Accept: application/json
  ```
   ### Response
  ```json  
{
    "data": {
        "id": "null",
        "type": "image",
        "attributes": {
            "image": {
                "location": "San Diego",
                "image_url": "https://www.pexels.com/photo/marina-during-golden-hour-2157685/"
            },
            "credit": {
                "source": "pexels.com",
                "author": "Lucas Fonseca",
                "logo": "https://images.pexels.com/lib/api/pexels-white.png"
            }
        }
    }
}
  ```

</div>
   
<div align="center">
 <h2> Plan A Road Trip <h2>
</div>
<div align="left">
  
  ```ruby  
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
  ```
   ### Response
  ```json  
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
  ```
</div>

<div align="center">

# Version Two 

All endpoints in Version 2 require an authentication token in order to call such endpoints. To obtain an authentication token please follow the instructions regarding the [login endpoint](#login)

## Database Schema
  
 ![Screen Shot 2022-07-28 at 12 07 31 PM](https://user-images.githubusercontent.com/87443686/181585921-7bcfe465-6ab3-474e-ba48-dfa4cb26d9dc.png)

# Login 
  
# COLLABORATION

If any ideas for improvement, any errors are seen, or if you are interested in building something in the future, please feel free to contact me directly via any of the below avenues:<br><br> 
[![Linkedin Badge](https://img.shields.io/badge/-GregFlaherty-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/gregoryjflaherty/)](https://www.linkedin.com/in/gregoryjflaherty/) 
[![Gmail Badge](https://img.shields.io/badge/-gregoryjflaherty@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:gregoryjflaherty@gmail.com)](mailto:gregoryjflaherty@gmail.com)
  
  [![github-readme-twitter](https://github-readme-twitter.gazf.vercel.app/api?id=gregjflaherty)](https://github.com/gazf/github-readme-twitter)
  
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
Figaro | <br><br>

  # FRONTEND



![weather1](https://user-images.githubusercontent.com/87443686/165556007-c29fe8fa-f33a-4cf7-b6b7-16f12f8abf83.png)
![weather2](https://user-images.githubusercontent.com/87443686/165556094-4acecfd3-eea6-4f25-82e9-9e033745a1fd.png)
![weather3](https://user-images.githubusercontent.com/87443686/165556492-a35b2c81-c04f-40da-9109-87a8e11bfe5b.png)
![weather4](https://user-images.githubusercontent.com/87443686/165556501-ac86624e-d367-4a83-82da-04ab4ebabb1b.png)

</div>
