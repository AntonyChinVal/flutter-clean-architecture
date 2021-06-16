[![Build Status](https://travis-ci.com/AntonyChinVal/flutter-clean-architecture.svg?branch=master)](https://travis-ci.com/AntonyChinVal/flutter-clean-architecture)

# CleanFlutter
A Flutter project with Clean Architecture and BLoC. **For the link of the project presentation, click [here](https://prezi.com/view/XNsm2gaEECR1xur67XOV/).**

# Introduction

It's a layered and domain-centric architecture.  

With the following advantages:

* Structuring
* Decoupling
* Testable
* Independence

## Dependency Rule

This rule says that source code dependencies can only point inwards.


# Layers

## Domain
The `Domain` layer defines the business logic of the application.
* Core :  The main classes that are used in the `Domain` layer.
* Entities : Enterprise wide business rules.
* UseCases : Application specific business rules.
* Repositories : Abstract classes that define the expected functionality of outer layers.

## Data
The `Data` layer is responsible for data retrieval.
* Repositories : Concrete classes that implement the repository from the domain layer.
* ExternalData : Data source(Rest Api, Firebase , Device).

## Presentetation
The `Presentetation` layer is the representation of the application.
* Core : The main classes that are used in the `Presentetation` layer.
* Configuration : Initial settings of the `Presentetation` layer (Navigation, Initialization).
* Screens : Represents the user interface, events, and lifecycle.
    * Template : All the widgets that build the screen.
* Components : Interactive widgets for creating a user interface.

## Configuration
The `Configuration` layer contains all the general app configurations (Platform(IOS,Android), Firebase, Dependency Injection).

# Installation

Install [flutter](https://flutter.dev/docs/get-started/install) to run the project.

Run the following commands

```flutter
cd clean_project

flutter pub get

flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Firebase Installation
Install [FlutterFire](https://firebase.flutter.dev/) to be able to use Firebase.

# Run
```flutter
flutter run
```

## Run Test
```flutter
flutter test --coverage
```

## Run with Firebase
To compile with firebase, change the value of `FIREBASE` in `.env`.

```flutter
FIREBASE=true
```

```flutter
flutter run
```
# Libraries
* [Flutter BloC](https://pub.dev/packages/flutter_bloc)
* [Provider](https://pub.dev/packages/provider)
* [Dio, Http Client](https://pub.dev/packages/dio)
* [GetIt, Service Locator](https://pub.dev/packages/get_it)
* [Injectable](https://pub.dev/packages/injectable)

# References
* [The Clean Code Blog](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [Uncle Bob](http://cleancoder.com/products)
* [Clean Architecture Guide](https://proandroiddev.com/clean-architecture-data-flow-dependency-rule-615ffdd79e29)

* [Multiple ways of defining Clean Architecture layers](https://proandroiddev.com/multiple-ways-of-defining-clean-architecture-layers-bbb70afa5d4a)
# Help
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
