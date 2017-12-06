# all about that design

A ground-breaking, earth-shattering iOS app that will revolutionize your life.
Global warming. CS50 Psets. Trump. All these factors impede our productivity. But don't worry, Thunderwear is here to save the day.

This is THUNDERWEAR.

Upon the simple press of a button, combining the most recent local weather information, Thunderwear will provide you with accurate knowledge of the most suitable outfit to wear. Thunderwear is intended for all audiences to easily manage their outfit choices, dressing appropriately through all four seasons, all year round, rain or shine.

## general

Thunderwear was designed in two main components: the "front end" coded in Swift, and the "back end" coded in Python and using Flask. Together, they work to produce the iOS app, sending location information and weather information back and forth to get outfit suggestions.

## swift front end

The front end of Thunderwear was coded in Swift 3 and run in the program Xcode 9. The library Alamofire **add link** was used to assist in the communication between the front end and back end of the app.

### main storyboard

The storyboard gives a visual representation of what the app looks like.

**add more here, jess, because I can't view the storyboard from my computer :(**

### viewcontroller

The viewcontroller is where the code for the storyboard is placed. In Thunderwear, there are two viewcontrollers, one for each distinct screen.

The first viewcontroller handles the home page as well as the display of weather information. Therefore, before the user inputs a location, the headers mentioned in the Readme file ("Outfit Recommendations," "Weather," "Today's Temperature") must be hidden. Therefore, when the user initially opens the app, only the button "**Input Location**" is present. Once the user inputs the location, the code shows the previously mentioned headers as well as the weather information.

Depending on the weather conditions, the background of the viewcontroller will change. To do this, the viewcontroller gets the weather code from the weatherInfo array. If the first digit of the code is "2," "3," or "5," the background will change to different rain backgrounds and will warn the user to bring an umbrella and a rain jacket. 

### second viewcontroller

The second viewcontroller allows the user to input location information.

**add more here, jess, because I can't view the second viewcontroller from my computer**

## python/flask back end

**this space is for you sang-o**
- api
- talk about the algorithm here
- php tables
- list out all the static clothing types, and also the temperature ranges

## logo



## visual design


logo on top
input location button, redirects to second page
Where are you? - any location, click submit

submit -- asynchronous because waits for validation from backend, have to wait for main page

Outfit suggestion
weather
temperature

changing background

## overall comments and future improvements



A "design document" for your project in the form of a Markdown file called DESIGN.md that discusses, technically, how you implemented your project and why you made the design decisions you did. Your design document should be at least several paragraphs in length. Whereas your documentation is meant to be a user’s manual, consider your design document your opportunity to give the staff a technical tour of your project underneath its hood.
