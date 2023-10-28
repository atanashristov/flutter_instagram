# Flutter Instagram

Contains code and notes from [Udemy course](https://www.udemy.com/course/draft/3910230/learn/lecture/25442616#overview)

Original code from course [here](https://github.com/MarcusNg/flutter_instagram)

To run the desired flavor go to directory `instagram` and then either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

## Notes

## Section 2: Setup

Install [very_good_cli](https://pub.dev/packages/very_good_cli) globally: ```dart pub global activate very_good_cli```.

Create project and add pub.dev packages:
cd instagram

```sh
very_good create flutter_app instagram  --desc "Flutter Instagram app" --org "app.hristov"
flutter pub add cached_network_image # load and cache network images
flutter pub add meta # defines annotations that can be used by the tools that are shipped with the Dart SDK
flutter pub add enum_to_string # Better conversion of ENUMs to string and back
flutter pub add cloud_firestore # NoSQL cloud DB
flutter pub add firebase_analytics # Tracking user actions within the app
flutter pub add firebase_auth # Authenticate users
flutter pub add firebase_core # Core Firebase features
flutter pub add firebase_storage # Store files such as videos and images
flutter pub add flutter_bloc # BloC
flutter pub add equatable # Compare objects and works well with BloC
flutter pub add intl # internationalization and localization facilities
flutter pub add timeago # converts a date into a humanized text
flutter pub add uuid # unique identifiers
flutter pub add image_cropper # Crop images
flutter pub add image_picker # Select images. Needs additional setup (https://pub.dev/packages/image_picker)
```

`image_picker` needs additional setup for iOS. Add the following keys into "ios\Runner\Info.plist" file:

```xml
  <key>NSPhotoLibraryUsageDescription</key>
  <string>This app requires access to the photo library.</string>
  <key>NSCameraUsageDescription</key>
  <string>This app requires access to the camera.</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>This app does not require access to the microphone.</string>
```

`image_cropper` needs additional setup for Android. Add `UCropActivity` to "android\app\src\main\AndroidManifest.xml" file:

```xml
  <activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```

Create new project in [Firebase Console](https://console.firebase.google.com/):

- Project name: "flutter-instagram"
- Enable Google analytics: yes
- Configure Google Analytics - Account: "Default Account" or create new "flutter-instagram"

Add iOSs app:

- iOS bundle ID: "app.hristov.instagram" - you can find in "ios\Runner.xcodeproj\project.pbxproj" under "PRODUCT_BUNDLE_IDENTIFIER"

Download "GoogleService-Info.plist"

- Save under "ios\Runner\GoogleService-Info.plist".

TODO: It has to be added in XCode under "Runner" below "Info.plist".s

- Skip thee rest of steps

Add Android app:

- Android package name: "app.hristov.instagram" - you can find in "android\app\build.gradle" under "android\namespace"

Download "google-services.json"

- Save under "android\app\google-services.json"

Note: similarly add "app.hristov.instagram.stg" and "app.hristov.instagram.dev" projects for the staging and dev environment.

Edit "android\app\build.gradle" and change API levels, see: [api levels](https://apilevels.com/)

- See: [Gradle configurations](https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration)

Click next - Add Firebase SDK, select Groovy and follow the instructions ...

- Add the plugin as a dependency to your project-level build.gradle file under "android\build.gradle":

```gradle
    dependencies {
      ...
        classpath 'com.google.gms:google-services:4.4.0'
```

- Apply the plugin in the app-level build.gradle file under "android\app\build.gradle":

```gradle
apply plugin: 'com.google.gms.google-services'
```

- Import Firebase BoM dependency into the app-level build.gradle file under "android\app\build.gradle". Add any product you want to use as listed on [this page of available libraries](https://firebase.google.com/docs/android/setup#available-libraries)

```gradle
dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.4.0')
    implementation 'com.google.firebase:firebase-analytics'
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.firebase:firebase-firestore'
    implementation 'com.google.firebase:firebase-storage'
```

Add Authentication from the Firebase Console (section Build from the menus on the left)

- Add "Email & Password" Sign-in provider. You can also enable other providers from the list if you want.

Add Firestore Database

- Select "Start in test mode" - anyone with DB reference will be able to access for 30 days
- Go to the "Rules" section of the "Cloud Firestore" and replace the 30 days access with authenticated access:

instead of this:

```js
    match /{document=**} {
      allow read, write: if request.time < timestamp.date(2023, 11, 20);
    }
```

do this:

```js
    match /{document=**} {
      allow read, write: if request.auth.uid != null;
    }
```

Add Storage

- apply similar configuration to the Firestore configuration

To make sure the Firebase works normally we make the `main()` method async and add these below 2 lines just before the `runApp()` call. In this case we add to "lib\bootstrap.dart" under `bootstrap()`:

```dart
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
```

## Section 2: Setup: New Firebase Flutter integration

This follows the instructions [Add Firebase to your Flutter app](https://console.firebase.google.com/u/0/project/flutter-instagram-599bd/overview).

Install [Firebase CLI and login](https://firebase.google.com/docs/cli?hl=en&authuser=0&_gl=1*18clbvm*_ga*MTE4Mjk2Nzk5Ni4xNjk3OTIxNDU2*_ga_CW55HF8NVT*MTY5NzkzMjA3Mi4zLjEuMTY5NzkzMzc1NC41My4wLjA.#install_the_firebase_cli)

```sh
nvm install latest
nvm use 21.0.0
npm install -g firebase-tools
firebase login --reauth
firebase projects:list
```

Add Firebase to the project.
This automatically registers your per-platform apps with Firebase and adds a lib/firebase_options.dart configuration file to your Flutter project.

```sh
$ dart pub global activate flutterfire_cli
$ flutterfire configure --project=flutter-instagram-599bd

...
Firebase configuration file lib\firebase_options.dart generated successfully with the following Firebase apps:

Platform  Firebase App Id
web       1:375034192591:web:c5d0a13fb3ce0bc5ca8dba
android   1:375034192591:android:4686cbd8ed5e01a3ca8dba
ios       1:375034192591:ios:c3582225019fd133ca8dba

Learn more about using this file and next steps from the documentation:
 > https://firebase.google.com/docs/flutter/setup
```

Initialize Firebase, call Firebase.initializeApp from the firebase_core package with the configuration from your new firebase_options.dart file.

Add this to the "bootstrap.dart":

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
```

Then, add and begin using the [Flutter plugins](https://firebase.google.com/docs/flutter/setup?hl=en&authuser=0&_gl=1*1rz2zju*_ga*MTE4Mjk2Nzk5Ni4xNjk3OTIxNDU2*_ga_CW55HF8NVT*MTY5NzkzMjA3Mi4zLjEuMTY5NzkzNTk2Ni42MC4wLjA.&platform=ios#available-plugins)
for the Firebase products you'd like to use.

```sh
flutter pub add firebase_analytics
flutter pub add firebase_auth
flutter pub add cloud_firestore
flutter pub add firebase_storage
```
