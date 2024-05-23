## What is this project?
This project is part of iOS assessment with the Trailhead Team of Salesforce

## Get Started
To get started, first go to [Open Weather](https://home.openweathermap.org/api_keys) and generate an API key. Replace the `openWeatherAPIKey` variable in the file `OpenWeatherAPIKey.swift` with your API Key.

Then when you build for the first time, you will have to `Trust and Enable` a few frameworks that are related to ComposableArchitecture.

## TODO's
First off, the places where work will need to be done will be marked with `TODO`.

Create an iOS application that allows a user either preselect a list of given addresses or user to enter their own address. Then retrieve and display the current weather and 5-day forecast from OpenWeather.

Here are the requirements

* Provide a search entry text box or a list of pre-defined locations
* Each current weather result should show:
    * Current Location
    * Weather description
    * Temperature
    * Wind direction and speed
    * Rain if there's any
* Notify the user if the address isn't found or the weather wasn't available for that location (error handling)
* Each forecast item should show:
    * Weather description
    * Temperature
    * Wind direction and speed
    * Rain if there's any

Mobile App

The App Should include the following

* All code is written in Swift. UI can be UIKit or SwiftUI
    * There are placeholders within the app to write the views and its associated layers in SwiftUI (`SwiftUIView.swift`) or UIKit (`UIKitController.swift`)
* Handle error conditions from API
* Unit tests should be included. We’d love to see how you think about testing features and separating code to do so.
