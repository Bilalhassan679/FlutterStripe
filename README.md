Requirements
Android
This plugin requires several changes to be able to work on Android devices. Please make sure you follow all these steps:

Use Android 5.0 (API level 21) and above
Use Kotlin version 1.5.0 and above: example
Using a descendant of Theme.AppCompat for your activity: example, example night theme
Using an up-to-date Android gradle build tools version: example and an up-to-date gradle version accordingly: example
Using FlutterFragmentActivity instead of FlutterActivity in MainActivity.kt: example
Rebuild the app, as the above changes don't update with hot reload
These changes are needed because the Android Stripe SDK requires the use of the AppCompat theme for their UI components and the Support Fragment Manager for the Payment Sheets

If you are having troubles to make this package to work on Android, join this discussion to get some support

iOS
Compatible with apps targeting iOS 11 or above.

Web (Experimental)
Now you can use Stripe with Flutter web! Notice right now it is highly experimental and only a subset of features is implemented.

Check the steps needed here





/////////////////////////////////////////
Follow this link 
https://github.com/flutter-stripe/flutter_stripe#android
Follow this video 
https://www.youtube.com/watch?v=-g46zHs3WkQ&t=8s
//////////////////////////////////////////
