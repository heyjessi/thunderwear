# all about that design

A ground-breaking, earth-shattering iOS app that will revolutionize your life. Global warming. CS50 Psets. Trump. All these can be scary and confusing. But don't worry, Thunderwear is here to save the day.

This is **THUNDERWEAR**.

![Image of Thunderwear Logo](https://github.com/azhou4/thunderwear/blob/master/iTunesArtwork%403x.png)

With the simple press of a button, Thunderwear will retrieve your local weather information and dynamically provide you with an accurate clothing recommendation. Thunderwear is intended for all audiences to easily manage their outfit choices by dressing appropriately through all four seasons, all year round, rain or shine.

## general

Thunderwear is designed in two main components: the "front end" coded with Swift, and the "back end" coded with Python and using Flask. Together, they work to produce the iOS app, sending HTTP requests (location information and weather information) back and forth to get outfit suggestions.

## swift front end

The front end of Thunderwear was coded in Swift 3 and run in the program Xcode 9. The library [Alamofire](https://github.com/Alamofire/Alamofire) was used to assist in the communication between the front end and back end of the app.

### main storyboard

The storyboard gives a visual representation of what the app should look like on a specific Apple device. During our coding process, we used the iPhone SE to model our main story board and add features. However, through Swift constraints, it made it possible to view a similarly centered set-up screen on any iOS device. Specifically, we tested the same code on an iPad and an iPhone 8. 

The storyboard includes multiple objects from the Object Library provided by Swift. This is includes Labels, Buttons, Images, and a text field. Upon dragging and dropping the objects into the View Controller and connecting the objects to the code, the user can start programming interactions/connections between objects. Additionally, the First and Second View Controller contain the logo image at the top. Just like classes and structs, the Objects in Swift have properties such as .text, .textColor and .isHidden. These can be set and changed in the ViewContoller file after a certain function is called such as a press of a button or a segue (transitioning from one view controller to the next).

### viewcontroller

The viewcontroller is where the code for the storyboard is placed. In Thunderwear, there are two viewcontrollers.

The first viewcontroller handles the home page as well as the display of weather information. As a result, before the user inputs a location, the headers mentioned in the Readme file ("Outfit Recommendations," "Weather," "Today's Temperature") will be hidden. Therefore, when the user initially opens the app, only the button "**Input Location**" is present. Once the user inputs the location, the headers that were initially hidden will be shown as well as the information received from the HTTP request.

Depending on the weather conditions, the background of the viewcontroller will change. To do this, the viewcontroller gets a weather code from the weatherInfo array, which is coded to be the first array element. If the first digit of the code is "2," "3," or "5," signifying there is some form of rain, the background will change to different rain backgrounds and will warn the user to bring an umbrella and a rain jacket. If the first digit of the code is "6", signifying there is snow, the background will change to a snowy picture. The default image is a blue solid background. This design enhances the visual appeal of the app, improves user experience, and enhances the quality of the weather/outfit suggestion.

### second viewcontroller

The second viewcontroller allows the user to input a location and submit this as an HTTP request. First, we needed to import the Alamofire library to the file. Additionally, we created an array of strings called weatherInfo as a global variable (so that its JSON elements can be easily accessed and changed in both the First and Second ViewContoller.swift files). In the Second ViewController, we also created an action function if the user clicks on the submit button. This sends the location information in the text field to the server and waits for validation. After receiving the validation, the app programatically redirects the user back to the main page. This was done because if the screen were to redirect back to the first view controller without receiving validation from the server, the main page would not show the information. This decision ensures that the information will always be shown once the user presses submit.

If the user were input a second location by clicking on "input new location" again, the Second ViewController loads and the weatherInfo array is initialized to empty in order to ensure that the new data and the old data aren't contained together.

## python/flask back end

In short, the server receives an HTTP request and a location from the mobile app and outputs a list of clothes suited for the current weather by the google maps and weatherbit APIs as well as from a SQL database.

First, the mobile app sends the server a POST request that contains JSON information taken from the location "search" bar in the app. Then, Python receives said information and uses it as the argument in the weather function. 

The weather function first takes in the argument and via the google maps API, converts it to its specific latitude and longitude coordinates. Then, it stores the weather code and high and low temperature for the day via the weatherbit daily API and then proceeds to call the weatherbit hourly API. 

From here, the majority of the code is the algorithm itself - how to convert temperature into clothing. We created 5 tables ("vhot", "hot", "mild", "cool", "cold") in the sqllite database called "info" that each had their own specific outfit choices (i.e. "vhot" = "tank top", "short shorts") and their own specific temperature boundaries (i.e. "hot" is between 70 and 80°F). While reading in the hourly forecast for the next 12 hours one by one, we sorted each hourly temperature into one of the 5 groups and at the end, tallied them all up. Then we selected the temperature group that had the highest tally to be the one group from which we would choose both a "top" and a "bottom". However, if after tallying up all the values the highest tally and the second highest tally were separated by at most a difference of 2, we selected the two respective temperature groups and chose a "top" from one and a "bottom" from the other. In other words, if over the next twelve hours, seven of the hours were in one temperature group and the other five were in an adjacent temperature group, we would mix outfit chocies from the two groups, because it suggested that the weather was right between the start of one group and the end of another. Also, we added onto our list of clothing choices additional miscellanous items if it was cold or raining. 

Finally, along with the weather code and the daily high and low temperature, we returned a list of the outfit choices in a JSON format to the ios mobile app.

Additionally, this code actually caches all the locations and their respective information, especially because of the limited nature of the free weather APIs at use in the code. Thus, it starts by checking if the received location has already been searched once and if so, then it just returns the cached information without calling the API. Only if the location is new does the code call the API. 

Furthermore, there is another randomize function that weather function calls that just serves to randomize clothing options, so that for a certain temperature, it doesn't always output the same outfit choices. 


## logo

We wanted to design a simple, clean, easily recognizable, yet unique logo. Combining a cloud, sun, and clothes hanger, we designed a logo that encapsulates the functionality and purpose of Thunderwear. The logo was designed using the online service [Canva](https://www.canva.com/).

![Image of Thunderwear Logo](https://github.com/azhou4/thunderwear/blob/master/Icon-App-83.5x83.5%402x.png)


## overall comments and future improvements

This first prototype of Thunderwear is useful and well-designed, but the app could be further improved for better app performance and for better user experience.

User experience could be greatly improved by incorporating an image aspect. Originally, we planned to allow Thunderwear to store user's photos of their clothing. After adding a label to each article of clothing, the outfit recommendation would be accompanied by images of the user's won clothing. However, although a camera and image loader from the Apple photo library were easy to implement, storing these images was not easily implemented in Swift. Most resources on the internet were outdated as Swift is a new and frequently updated language, and the methods to store multiple photos internally and later retrieving these photos was not immediately obvious. Eventually, after several hours of attempts and several new projects/workspaces, our group decided not to include this feature in the first prototype of Thunderwear.

In order for the user to receive outfit recommendations, a post request must be sent from the front end to back end, and a response must be received from the back end to front end. Therefore, this delay in order to load information slows down app performance.

Learning to code in Swift/Xcode to develop an iOS app was a great and exciting learning experience. Although simple, we believe Thunderwear has the potential to make a real positive impact on people's lives. We hope you enjoy using our very first iOS app!

This was **THUNDERWEAR**.
