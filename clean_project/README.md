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

### Entity
Enterprise wide business rules.

### Use Case
Application specific business rules.

### Repository
Abstract classes that define the expected functionality of outer layers.

## Data
The `Data` layer is responsible for data retrieval.

### Repository
Concrete classes that implement the repository from the domain layer.

### External Data
Data source(Rest Api, Firebase , Device)

## Presenter
The `Presenter` layer is the representation of the application.

### Screen
Represents the user interface, events, and lifecycle.

### Template
All the widgets that build the screen.

### BloC
Component that converts a sequence of incoming events into a sequence of outgoing states.

## Configuration
The `Configuration` layer contains all the general app configurations(Platform(IOS,Android), Firebase, Dependency Injection).

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
To compile with firebase, in `.env` change the value of `FIREBASE`.

```flutter
FIREBASE=true
```

```flutter
flutter run
```

# Help
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
