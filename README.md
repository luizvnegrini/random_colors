# Random Colors

This project is a simple Flutter application developed for a technical test. It demonstrates the ability to create an interactive user interface with animated color changes. The app allows users to tap the screen, which triggers a smooth transition to a new random background color. This showcases the developer's skills in implementing animations, state management, and user interactions in Flutter.

# Demo

## Main Technologies
- Flutter
- Riverpod
- Flutter Hooks
- Dartz
- Mocktail

## Features
- Change background color when user tap on screen
- The color are changed randomly
- The color are changed using animations

## Possible new features
- Save favorite colors
- Paint Effect
- Time to change color automatically
- Sounds when user tap on screen or the color is changed
- History of colors

## SETUP

### **0 Install Flutter Framework**

[See docs here.](https://docs.flutter.dev/get-started/install)

## **1. Running the project**

First of open your terminal and go to the app main folder and run `flutter pub get` to resolve dependencies.

To run, take into account the flavors `dev`, `hml` e `prod`.  

Always run as follows:  

```bash
cd app
flutter run -t lib/main-<flavor>.dart --flavor <flavor> 
```

## **2 Creating/editing flavors**

For the creation of flavors, the package [flutter_flavorizr](https://github.com/AngeloAvv/flutter_flavorizr) was used.

Follow your documentation for adding/editing flavors.


## **3. Tests**

To maintain organization, each test file must be created in the same folder structure as the file being tested. Example:

```bash
# Implementation
/app
  /lib
    /domain
      /usecases
        /generate_new_color.dart

# Test
/app
  /test
    /domain
      /usecases
        /generate_new_color.dart
```


## **4. Design system**

Project uses Atomic Design for create the Design System. Click [here](https://bradfrost.com/blog/post/atomic-web-design/) to read about Atomic Design.

## **5. Critique and improvements**

About the project I tried to deliver something robust but there is always more to do, in this case I would like to perform more tests, different types of tests such as "golden tests" and "widget tests" that were not implemented, reevaluate the code and see if any refactoring would be necessary to leave the cleaner code.

To solve the problem of negative reviews and crash reports I would work on the performance of the application and test with real devices in addition to using emulators for older device versions. It is possible to carry out tests with the use of third-party products that test on many real devices, it would also track all application usage with analytics and crashlytics.

The application has already been architected for a scale of teams, it is already a monorepo and modularized. It also uses techniques for inject dependencies lazyLoading and yield return and also using separate threads (isolates) between UI and business layer. I didn't create any more modules because it's a simple app, one module is enough, but an example of another module would be any other feature such as authentication, and the others I suggested at the beginning of this file.

It would certainly be possible to solve the problem proposed with a simpler app, but I want to make it clear that I did it in this way and with complexity to meet the request that the app must be scalable and also to show my knowledge, I hope I have fulfilled it.

### **5.1 Improvements**

- One of the urgent points of the application would be to implement a theme for the app, thus reducing the boilerplate and increasing the speed of product development.
- Have a more complete error handler
- Golden tests
- Widget tests
