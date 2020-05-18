# Features

- Uses the MVVM Architecture
- Completely written using programmatically UI
- Written in swift 5
- Proper use of dependency injection wherever required
- Use of design pattern wherever needed.
- Follows Ray Wenderlich coding standards
- Can upload picture from gallery
- Also able to upload images from Camera
- Unique design which uses a detail screen to provide a rich exprience for editing
- Connects to backend on locahost and performs updates and fetches in real time
- Autocomplete available to location selection
- UI works on any sized iPhone
- The UI is compatible with iPad
- Resuable UI controller for selection of options and for ediable controller.
- Resusale Selection controller that lets the user pick the right options
- Sopisticated network error handling when displays error from server in a readable way
- Validation of user input when required. 
- Enterprise grade git strategy with master, development, test and branches for each main feature
- The application 

![](https://github.com/vishwas513/EditableProfile/blob/master/screenshots/pic1.png)
![](https://github.com/vishwas513/EditableProfile/blob/master/screenshots/pic2.png)


# How to run
- Git clone or download zip 
- Run server first by using the command ./server.sh. 
- run .xcodproj file and press the play button to run on simulator or device.

# Notes
- This project is focused on the client or the iOS mobile appication
- The backend is simulated by using a npm dependency called json-server which is similar to the one provided (http-server), except it treats the db.json as a database annd is capable of not only GET but PUT and POST aswell. 
- I wanted to build a backend using node, express and mongo and host it on heroku but unfortunately, my schedule did not perit me.
- The dependency json-server is automatically installed when the command ./server.sh is run. 
- The master branch should contain everything needed but please feel free to checkout my other branches Developmennt, test and various branches for the features to see my progress incrementally.
- I wanted to build a backend using node, express and mongo and host it on heroku but unfortunately, my schedule did not perit me.
- Please not that the imageView for profile picture is intially greyed out and this is expected behavior, and only changes when set. 
- The image is not uploaded to the server and is only in play locally, as I could not configure a CDN in time.
- 







