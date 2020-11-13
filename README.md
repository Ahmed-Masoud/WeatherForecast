# WeatherForecast

This app simply hows the current weather based on your current location. Built on openWeatherMap api

## Demo
![Alt Text](https://media.giphy.com/media/C18O4GRDa5HaB6LdNp/giphy.gif)

# Core Features!
  - Big overview on today's weather
  - horizontal scroller showing 48 hours information of temprature
  - extra information about today's weather also available at the bottom of the home screen
  - list of the full week starting tommorow showing brief about the tempreture
  - taping on any day takes you to details screen to see extra information
  - the app supports centigrade and fahrenhite
  - settings page to choose your prefered measurment unit
  - the app saves your selection of measurment and sets it as default
  - the app sends a local notification every day at 10:30 AM to remind you to check the weather
# Extra Features!

  - Background Fetcher to always keep the ui updated (To test it)
       - run on a real device
       - pause program execution
       - type this command in console 
           ```
           e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"com.fetchWeather"]
           ```
       - resume the running 
  - Offline storage saving the last known temprature for the user
  - Demonstration of multiple config enviroments (Staging/Production)
  - Demonstration for Unit Tests

### Todos

 - Write MORE Tests

License
----
MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
