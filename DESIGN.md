# all about that design

A ground-breaking, earth-shattering iOS app that will revolutionize your life.
Global warming. CS50 Psets. Trump. All these factors impede our productivity. But don't worry, Thunderwear is here to save the day.

This is **THUNDERWEAR**.

![Image of Thunderwear Logo](https://github.com/azhou4/thunderwear/blob/master/iTunesArtwork%403x.png)

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

Depending on the weather conditions, the background of the viewcontroller will change. To do this, the viewcontroller gets the weather code from the weatherInfo array. If the first digit of the code is "2," "3," or "5," signifying there is some form of rain, the background will change to different rain backgrounds and will warn the user to bring an umbrella and a rain jacket. If the frst digit of the code is "6" or "7," signifying there is no rain, the background will change to an image relevant to the weather condition. This design enhances the visual appeal of the app, improves user experience and enhances the quality of the weather/outfit suggestion.

Lastly, the getOutfit button in viewcontroller sends an Alamofire request to the back end,
**sorry i don't really understand what's going on here**

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

We wanted to design a simple, clean, easily recognizable, yet unique logo. Combining a cloud, sun, and clothes hanger, we designed a logo that encapsulates the functionality and purpose of Thunderwear. The logo was designed using the online service Canva **add link**.

![Image of Thunderwear Logo](https://github.com/azhou4/thunderwear/blob/master/Icon-App-83.5x83.5%402x.png)

## visual design




## overall comments and future improvements

This first prototype of Thunderwear is useful and well-designed, but the app could be further improved for better app performance and for better user experience.

User experience could be greatly improved by incorporating an image aspect. Originally, we planned to allow Thunderwear to store user's photos of their clothing. After adding a label to each article of clothing, the outfit recommendation would be accompanied by images of the user's won clothing. However, although a camera and image loader from the Apple photo library were easy to implement, storing these images was not easily implemented in Swift. Most resources on the internet were outdated as Swift is a new and frequently updated language, and the methods to store multiple photos internally and later retrieving these photos was not immediately obvious. Eventually, after several hours of attempts and several new projects/workspaces, our group decided not to include this feature in the first prototype of Thunderwear.

In order for the user to receive outfit recommendations, a post request must be sent from the front end to back end, and a response must be received from the back end to front end. Therefore, this delay in order to load information slows down app performance.

Learning to code in Swift/Xcode to develop an iOS app was a great and exciting learning experience. Although simple, we believe Thunderwear has the potential to make a real positive impact on people's lives. We hope you enjoy using our very first iOS app!

This was **THUNDERWEAR**.
