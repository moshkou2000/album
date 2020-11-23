# album

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

### BLocC
This application implemented using BLocC.
StatefulWidget has used to pass data to BLoC or get data from BLoC.
It's because lifecycle methods available in the StatefulWidget 
dispose() method has overridden to dispose BLoC and destroy any data has been populated within the BLoC.

### Event
abstract ButtonEvent is used to pass button pressed event to BLoC.
It's used for button 1 & 2 in HomePage.

### Provider
abstract HttpProvider is used to have a same dataprovider structure in application.
It's generic http provider and can be inherited to create other providers (example: a provider which required a license).

AlbumProvider is used to call the given API URL's in assingmen.
Expected response would be in AlbumModel(Expected DataModel) format if it got success,
otherwise it would throw Exception.

### HomePage
ButtonBar contains button 1 & 2 on top of the page.
GridView is used to populate the page with expected data which has been fetch via AlbumProvider.

To get the current orientation (2 columns in Porterate & 5 in Landscape) OrientationBuilder has been used. 


## Plagins
Service Provider
http: ^0.12.0+4

Image View
transparent_image: ^1.0.0

Unit Test
mockito: ^4.1.3

## Editor
Visual Studio Code 1.51.1