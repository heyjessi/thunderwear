# thunderwear

A ground-breaking, earth-shattering iOS app that will revolutionize your life.
Global warming. CS50 Psets. Life. All these can be scary and confusing. But don't worry, Thunderwear is here to save the day.

This is **THUNDERWEAR**.
![Image of Thunderwear Logo](https://github.com/azhou4/thunderwear/blob/master/THUNDERWEAR%20(4).png)

With the simple press of a button, Thunderwear will retrieve your local weather information and dynamically provide you with an accurate clothing recommendation. Thunderwear is intended for all audiences to easily manage their outfit choices by dressing appropriately through all four seasons, all year round, rain or shine.

## setup

Since Thunderwear has not yet been published in the app store, the Github Xcode file must be downloaded in order to access the iOS app. To access, simply download the Thunderwear folder on Github and open the project in Xcode. Ensure you have set up an account, allocated a Team, and also entered in your Apple credentials in the Project Settings of Xcode before attempting to run the app on your own device. Also, before running Xcode, be sure to check that CocoaPods and Alamofire are downloaded via terminal onto the computer (for additional details, read below). Additionally, download the backend code and run flask in order to set up the server. Once you've finished these steps, connect your iOS device to your computer and press the Play button on the top left of the screen to run Thunderwear on your own device.

Additional details on how to download CocoaPods and Alamofire:

For CocoaPods, follow the steps outlined in https://stackoverflow.com/questions/20755044/how-to-install-cocoa-pods (Do not type in pod 'AFNetworking', '0.9.1' as outlined in step 6 as this is just an example)
To install Alamofire, after uncommenting platform :ios, '9.0'  and use_frameworks! (if not already done for you), simply write the following directly below use_frameworks!: "pod 'Alamofire','~> 4.5’,
Then to complete, return to the terminal and execute step 7 of the CocoaPods installation by writing the following: pod install

## features

Thunderwear was designed to be extremely intuitive and user-friendly. Upon opening Thunderwear, the user is greeted by the home page. The home page is simple and clean, displaying only the Thunderwear logo and a button labelled "**Input Location**."

<img src="https://github.com/azhou4/thunderwear/blob/master/Screen%20Shot%202017-12-07%20at%2012.55.28%20am.png" width="400">

To start, press the "**Input Location**" button. The user is redirected to the Location page where they can input either their current location or any location in the world. For ease of use, the location can be inputted in many formats (i.e. Street Address, City; City, State, Country; Zip code; Longitude, Latitude; etc.), similar to the way locations can be inputted in Google Maps.

<img src="https://github.com/azhou4/thunderwear/blob/master/Screen%20Shot%202017-12-07%20at%2012.55.54%20am.png" width="400">

After entering location, clicking "**Submit**", and waiting a few seconds, the user will be directed back to the home page. This time, however, the home page will display a variety of features to guide the user to choose an outfit to wear. First, the background of the screen may change depending on the weather conditions of the location. For example, if there is a chance of precipitation, the background of the app will show rain pictures. Secondly, under the header "*Outfit Recommendations*," dynamically suggested clothing items such as short-sleeve shirts, long pants, coat/jackets will be made depending on the weather forecast and temperature of the location. If it is especially cold, the main menu will display the message "Don't forget to bring" with items such as mittens and gloves or scarves. Underneath "*Outfit Recommendations*," the "*Weather*" heading will provide additional advice regarding the precipitation and snow, such as remembering to bring an umbrella on a rainy day. In addition, there is a header called "*Today's Temperature*" that displays the High and Low temperatures. Lastly, there is another "**Input Location**" button at the bottom, allowing the user to easily look up another location if needed.

<img src="https://github.com/azhou4/thunderwear/blob/master/Screen%20Shot%202017-12-07%20at%2012.56.23%20am.png" width="400">

Because we believe that all people should have access to thunderwear technology, it doesn't matter which device a user has. Our app will work on any Apple device including iPhones, iPad Minis, and iPads.

We believe Thunderwear has the potential to make a real positive impact on people's lives. We hope you enjoy using our very first iOS app!


This was **THUNDERWEAR**.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=PfQu2mmKz8s
" target="_blank"><img src="http://img.youtube.com/vi/PfQu2mmKz8s/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="480" height="360" border="10" /></a>

## acknowledgements

Special thanks goes to our TFs Miles, Menaka, and Emma as well as Nick and Thomas for helping us learn Swift and get a headstart on our project. We couldn't have made a usable iOS app without you.

Thunderwear is brought to you by three CS50 students :girl: :boy: :girl:

