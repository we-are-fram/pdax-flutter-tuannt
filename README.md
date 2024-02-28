# User List Sample

## Introduction

This application is made by Flutter. It helps retrieve user from https://dummyjson.com  then displays them in UI.
API URL is : https://dummyjson.com/users?limit=20&skip=10  the 'limit' and 'skip'  use for pagination.
## Prerequisite

To run the app, you need to setup Flutter in your machine. Please refer to [flutter.dev](https://docs.flutter.dev/get-started/install) for full setup

## Development

I use Flutter version 3.10.6 and Android studio to develop. You shouldn't see any warning in Dart Analysis when using this Flutter version
Check environment by:
  ```shell
  flutter doctor
  ```

## Run the app

This app can be run on Android, iOS and Web

- **Install package dependencies**

  ```shell
  flutter pub get
  ```

Then you can run

  ```shell
  flutter clean
  flutter pub run build_runner build
  flutter run
  ```

and choose device you want to run.

### Run on webthe app

  ```shell
  flutter run -d chrome
  ```

Project should be built and run Chrome.

 