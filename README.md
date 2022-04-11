Requirements
Android
This plugin requires several changes to be able to work on Android devices. Please make sure you follow all these steps:

Use Android 5.0 (API level 21) and above
Use Kotlin version 1.5.0 and above:Link https://github.com/flutter-stripe/flutter_stripe/blob/79b201a2e9b827196d6a97bb41e1d0e526632a5a/example/android/build.gradle#L2
Using a descendant of Theme.AppCompat for your activity: example LInk https://github.com/flutter-stripe/flutter_stripe/blob/main/example/android/app/src/main/res/values/styles.xml#L15, example night theme Link https://github.com/flutter-stripe/flutter_stripe/blob/main/example/android/app/src/main/res/values-night/styles.xml#L16
Using an up-to-date Android gradle build tools version: example Link https://github.com/flutter-stripe/flutter_stripe/blob/main/example/android/build.gradle#L9and an up-to-date gradle version accordingly: example Link https://github.com/flutter-stripe/flutter_stripe/blob/main/example/android/gradle/wrapper/gradle-wrapper.properties#L6
Using FlutterFragmentActivity instead of FlutterActivity in MainActivity.kt: example Link https://github.com/flutter-stripe/flutter_stripe/blob/79b201a2e9b827196d6a97bb41e1d0e526632a5a/example/android/app/src/main/kotlin/com/flutter/stripe/example/MainActivity.kt#L6
Rebuild the app, as the above changes don't update with hot reload
These changes are needed because the Android Stripe SDK requires the use of the AppCompat theme for their UI components and the Support Fragment Manager for the Payment Sheets

If you are having troubles to make this package to work on Android, join this discussion to get some support

iOS
Compatible with apps targeting iOS 11 or above.

Web (Experimental)
Now you can use Stripe with Flutter web! Notice right now it is highly experimental and only a subset of features is implemented.

Check the steps needed here

ANY Problem Go to official link 


/////////////////////////////////////////
Follow this link 
https://github.com/flutter-stripe/flutter_stripe#android
Follow this video 
https://www.youtube.com/watch?v=-g46zHs3WkQ&t=8s
//////////////////////////////////////////
