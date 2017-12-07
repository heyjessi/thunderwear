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

Lastly, the getOutfit button in viewcontroller sends an Alamofire request to the back end,
**sorry i don't really understand what's going on here**

### second viewcontroller

The second viewcontroller allows the user to input a location and submit this as an HTTP request. First, we needed to import the Alamofire library to the file. Additionally, we created an array of strings called weatherInfo as a global variable (so that its JSON elements can be easily accessed and changed in both the First and Second ViewContoller.swift files). In the Second ViewController, we also created an action function if the user clicks on the submit button. This sends the location information in the text field to the server and waits for validation. After receiving the validation, the app programatically redirects the user back to the main page. This was done because if the screen were to redirect back to the first view controller without receiving validation from the server, the main page would not show the information. This decision ensures that the information will always be shown once the user presses submit.

If the user were input a second location by clicking on "input new location" again, the Second ViewController loads and the weatherInfo array is initialized to empty in order to ensure that the new data and the old data aren't contained together.

## python/flask back end

**this space is for you sang-o**
- api
- talk about the algorithm here
- php tables
- list out all the static clothing types, and also the temperature ranges

## logo

We wanted to design a simple, clean, easily recognizable, yet unique logo. Combining a cloud, sun, and clothes hanger, we designed a logo that encapsulates the functionality and purpose of Thunderwear. The logo was designed using the online service [Canva](https://www.canva.com/).

![Image of Thunderwear Logo](https://github.com/azhou4/thunderwear/blob/master/Icon-App-83.5x83.5%402x.png)


## overall comments and future improvements

This first prototype of Thunderwear is useful and well-designed, but the app could be further improved for better app performance and for better user experience.

User experience could be greatly improved by incorporating an image aspect. Originally, we planned to allow Thunderwear to store user's photos of their clothing. After adding a label to each article of clothing, the outfit recommendation would be accompanied by images of the user's won clothing. However, although a camera and image loader from the Apple photo library were easy to implement, storing these images was not easily implemented in Swift. Most resources on the internet were outdated as Swift is a new and frequently updated language, and the methods to store multiple photos internally and later retrieving these photos was not immediately obvious. Eventually, after several hours of attempts and several new projects/workspaces, our group decided not to include this feature in the first prototype of Thunderwear.

In order for the user to receive outfit recommendations, a post request must be sent from the front end to back end, and a response must be received from the back end to front end. Therefore, this delay in order to load information slows down app performance.

Learning to code in Swift/Xcode to develop an iOS app was a great and exciting learning experience. Although simple, we believe Thunderwear has the potential to make a real positive impact on people's lives. We hope you enjoy using our very first iOS app!

This was **THUNDERWEAR**.
