# Dsp Student Application

This is the project for the student application

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Important notes

1. All colors you use must be from the class AppColors in themes.
2. All fonts you use must be from the class AppFonts, if you want to change font color or any other property, use .copyWith()
```dart
    Ex: {style: AppFonts.heading1.copyWith(color: AppColors.cGreen)
```
3. When drawing the curves in the sign up screen you should do it only once, and put it in components/vector Paths. 
4. Only 3 gradients are used, one for the headings, one for full backgrounds, and one for sign up/ HIW.
   When you create one put it in theme.dart in a class called AppGradients, to be reused throuoght the whole Project
5. Any component used in different pages you can put in a seperate widget and put it outside the page in /components folder.
6. All SVGS we used are in (https://drive.google.com/drive/folders/1MiVKw6pZnT7w6b2WqULQWW8VAuyyAedT?usp=sharing)
7. Please use AutoSizeText widget in package (https://pub.dev/packages/auto_size_text) instead of normal Text widget to make
    the app looks the same even on very small screens.
 8. Never set an exact width to a widget, make it fill the screen (using the Expanded Widget).

