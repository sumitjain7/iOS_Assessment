## What is this project?
This project is part of iOS assessment with the Trailhead Team of Salesforce

## Get Started
This project was built using XCode 15.2

Start by creating a fork of the project.

Once you have completed the assessment, reply to the Hacker Rank forum with the link to the Github Project

#### Please be sure to commit often so we can follow along with your work

### Open Weather API KEY
To get started with the open weather API, first go to [Open Weather](https://home.openweathermap.org/api_keys) and generate an API key. Replace the `openWeatherAPIKey` variable in the file `OpenWeatherAPIKey.swift` with your API Key.

## Instructions
First off, the places where work will need to be done will be marked with `TODO` (Please note that you have the freedom to use any implementation you would like or use the provided Address service).

Build onto this app that allows a user either preselect a list of given addresses or user to enter their own address. Convert the address into a `CLLocation` Object via one of the functions in the `AddressService`. You can create another function if you like if there is a different framework you would like to use to handle events.

Then take the result and retrieve and display the current weather and 5-day forecast from OpenWeather.

Here are the requirements:

* Provide a search entry text box or a list of pre-defined locations
* Each current weather result should show:
    * Current Location
    * Weather description
    * Temperature
    * Wind direction and speed
    * Rain if there's any
* Notify the user if the address isn't found or the weather wasn't available for that location (error handling)
* Each forecast item should show:
    * Date
    * Weather description
    * Temperature
    * Wind direction and speed
    * Rain if there's any

## Mobile App

The App Should include the following

* All code is written in Swift. UI can be UIKit or SwiftUI
    * There are placeholders within the app to write the views and its associated layers in SwiftUI (`SwiftUIView.swift`) or UIKit (`UIKitController.swift`)
* Handle error conditions from API
* Unit tests should be included. We’d love to see how you think about testing features and separating code to do so.

# Summary
To summarize:
* Create a service that calls the open weather API (API endpoint and the models are already provided).
* A basic SwiftUI or UIKit view to display the data (not both).
* An implementation of separation of concerns (ex. a ViewModel) so that data loading isn’t happening in a view controller.
* Unit tests for the different scenarios (ex. data loaded, error).

## End Result Example
The end product could look something like this:

![image desc](./Screenshots/Screenshot%202024-05-22%20at%208.35.04 PM.png)

OR this:

![image desc](./Screenshots/Screenshot%202024-05-22%20at%208.35.09 PM.png)
