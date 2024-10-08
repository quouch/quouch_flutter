# Quouch's Flutter App

Quouch's brand new Flutter app, built with the help of the Flutter SDK and the Dart programming language.
This app is a work in progress and will be updated as time goes on.

## Getting Started

To get started with this app, you will need to have the Flutter SDK installed on your machine. You can find the
installation instructions [here](https://flutter.dev/docs/get-started/install).

Once you have the Flutter SDK installed, you can clone this repository and run the app on your machine. To do this, run
the following commands:

```bash
git clone
cd quouch_flutter
flutter run
```

This will run the app on your machine, and you will be able to see the app in action.

### Translations

We're using internalization following [this guide](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization).
The translations are stored in the `lib/l10n` directory.

Every time you run `flutter pub get` or `flutter run`, codegen will happen automatically. You should find generated files in
`${root}/.dart_tool/flutter_gen/gen_l10n`. 
Alternatively, you can also run `flutter gen-l10n` to generate the same files without running the app.

## Tools

### Flutter SDK

A few resources to get you started with Flutter development:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which
offers tutorials, samples, guidance on mobile development, and a full API reference.
