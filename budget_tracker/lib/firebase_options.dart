// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDTK6jAj_x2kUW0K0W5JPO-ZQ2VHz8XKE4',
    appId: '1:349035813549:web:2a72f8dd987195efaa4424',
    messagingSenderId: '349035813549',
    projectId: 'budget-tracker-6e138',
    authDomain: 'budget-tracker-6e138.firebaseapp.com',
    storageBucket: 'budget-tracker-6e138.appspot.com',
    measurementId: 'G-EZ553ZVJPZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUv7eEVXu-It463yHGYgBgORY8pIo9_0U',
    appId: '1:349035813549:android:6bc897c608aa1edcaa4424',
    messagingSenderId: '349035813549',
    projectId: 'budget-tracker-6e138',
    storageBucket: 'budget-tracker-6e138.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2IkmLWRrV1YncILD9VhNhU7i-9NKjwJU',
    appId: '1:349035813549:ios:10fbbae536b117dfaa4424',
    messagingSenderId: '349035813549',
    projectId: 'budget-tracker-6e138',
    storageBucket: 'budget-tracker-6e138.appspot.com',
    iosClientId: '349035813549-b7caemilggu1vdiblnjunmjq7ijnni9n.apps.googleusercontent.com',
    iosBundleId: 'com.example.budgetTracker',
  );
}