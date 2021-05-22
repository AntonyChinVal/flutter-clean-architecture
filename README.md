# CleanFlutter

A Flutter project with Clean Architecture and BLoC. **For the link of the project presentation, click [here](https://prezi.com/view/XNsm2gaEECR1xur67XOV/).**

## Installation

Install [flutter](https://flutter.dev/docs/get-started/install) to run the project.

Run the following commands

```flutter
cd clean_project

flutter pub get

flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Firebase Installation
Install [FlutterFire](https://firebase.flutter.dev/) to be able to use Firebase.

## Run

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

## Help
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
