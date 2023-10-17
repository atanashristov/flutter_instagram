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

Create project:

```sh
very_good create flutter_app instagram  --desc "Flutter Instagram app" --org "app.hristov"
```
