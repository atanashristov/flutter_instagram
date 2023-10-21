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
