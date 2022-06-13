# CleanFlutter
A Flutter project with Clean Architecture.

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
* Repositories : Abstract classes that define the expected functionality of outer layers.

```flutter
cd template/modules/domain
```

## Data
The `Data` layer is responsible for data retrieval.
* Repositories : Concrete classes that implement the repository from the domain layer.
* ExternalData : Data source(Rest Api, Firebase , Device).

```flutter
cd template/modules/data
```

## Presentation
The `Presentation` layer is the representation of the application.
* Configuration : Initial settings of the `Presentation` layer (Navigation, Initialization).
* Screens : Represents the user interface, events, and lifecycle.
```flutter
cd template/modules/presentation
```

## App
The `App` layer contains all the general app configurations(Platform(IOS,Android), Dependency Injection, Run App).
```flutter
cd template/lib
```

# Installation

Install [flutter](https://flutter.dev/docs/get-started/install) to run the project.

Run the following commands

```flutter
cd clean_project

flutter pub get
```

# Run with Riverpod
```flutter
flutter run
```

# Libraries
* [Riverpod with hooks](https://pub.dev/packages/hooks_riverpod)
* [Flutter Hooks](https://pub.dev/packages/flutter_hooks)
* [Dio, Http Client](https://pub.dev/packages/dio)
* [GetIt, Service Locator](https://pub.dev/packages/get_it)
* [Dotenv](https://pub.dev/packages/flutter_dotenv)

# References
* [The Clean Code Blog](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [Uncle Bob](http://cleancoder.com/products)
* [Clean Architecture Guide](https://proandroiddev.com/clean-architecture-data-flow-dependency-rule-615ffdd79e29)
* [Multiple ways of defining Clean Architecture layers](https://proandroiddev.com/multiple-ways-of-defining-clean-architecture-layers-bbb70afa5d4a)
* [Security Tips](https://joshuamdeguzman.com/10-tips-to-secure-your-flutter-mobile-apps/)
* [SSL Pinning](https://pub.dev/packages/http_certificate_pinning)
# Help
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
