# graphql_spacex_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## Download Flutter SDK
- Go to the official site: https://flutter.dev/docs/get-started/install
- Download the appropriate version for your OS (Windows, macOS, Linux).

## Extract the SDK
- Unzip it to a desired location, e.g., C:\src\flutter (Windows) or ~/development/flutter (macOS/Linux).

## Set Flutter to PATH

Windows:
Open Environment Variables:
- Add C:\src\flutter\bin to the system PATH

## macOS/Linux:
Copy below line:
export PATH="$PATH:`pwd`/flutter/bin"
- (Add this to ~/.bashrc, ~/.zshrc, or ~/.bash_profile)

For Verify installation Run command in terminal : flutter doctor


✅ Step 2: Install Android Studio

## Download & Install from https://developer.android.com/studio

- Install Plugins
- Open Android Studio
- Go to Settings > Plugins

Search & install:
- Flutter

It will auto-install Dart
Setup Android SDK
Open SDK Manager

Install:

- SDK Tools: Android SDK Command-line Tools, Android SDK Build-Tools

- Android API version you need (e.g., API 34+)

✅ Step 3: Install Visual Studio Code (Optional Alternative)
Download from https://code.visualstudio.com/

Install Extensions
Flutter
Dart

🛠️ Setup Instructions git clone:

For Setup clone this github repository :

- open project in android studio or visual studio
- Open terminal and run command : flutter pub get
- Once pub get successfully done run the application in real device or in emulator


▶ Run the App
Click the Run ▶ button
- Before run the application connect your device with laptop or open emulator in laptop
- Once emulator or device connected click on ▶ button or run below command

Or use terminal and run command : flutter run

🛠️ FOR IOS SETUP
- Run command in terminal cd ios
- Again run command pod install or pod update
- if any error occur while running commands check the version for ios and also

A simple Flutter application that displays information about SpaceX launches, built primarily for
iOS and Android. It showcases some concepts such as:

- Atomic Design
- Clean Architecture
- Repository Pattern
- Dependency Injection



### Functionalities

The application displays information about SpaceX Launches and is consisted of 4 main screens:

- Upcoming Launches
    - This screen lists all the upcoming launches. It features a infinite scroll list and if you
      click a card you are redirected to the details of a launch. There is also a Text Field for you
      to filter the launches by name or flight number and a button to order by flight number
      ascending or descending.

- Launch Details:
    - This screen show the following(if available) details regarding the launch: Photos of the
      launch, location, payloads, crew and capsules information.

- Rockets
    - This screen lists all the Rockets. It features a infinite scroll list and if you click a
      card you are redirected to the details of a Rockets. There is also a Text Field for you to
      filter the mission by name and a button to order by flight number ascending
      or descending.

### About the implementation

I used several packages for the implementation of this application, but the main ones are:

- [blocy](https://pub.dev/packages/blocy) -> Used to create folder structure if any new page create
- [dartz](https://pub.dev/packages/dartz) -> Used to add some fuctional capabilities to Dart, more
  specificaly I used for the Either class, which I used with the Sealed Unions for my error handling
  and avoid try catches in the domain layer and to enforce the handle of errors from repositories
  and usecases.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) -> Used for the implementation of the MVVM
  Pattern, to abstract the logic from the Views.
- [go_router](https://pub.dev/packages/hydrated_bloc) -> Used for routing the page
- [get_it](https://pub.dev/packages/http) -> Used for Dependency Injector
- [equatable](https://pub.dev/packages/equatable) -> simplify equality comparisons between objects, especially for state management (e.g., Bloc, Cubit). By default, Dart uses reference equality, meaning two objects are only equal if they are the same instance in memory
- [graphql_flutter](https://pub.dev/packages/graphql_flutter) -> Used for 3rd party api for interacting with GraphQL APIs
- [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter) -> Used for youtube video player
