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
    apiKey: 'AIzaSyDujC1y-wu_eGnULUzJmz9gD7LUt85rat8',
    appId: '1:1006346901910:web:8aaa6b06fc1833955fe5b7',
    messagingSenderId: '1006346901910',
    projectId: 'agroressource-44db2',
    authDomain: 'agroressource-44db2.firebaseapp.com',
    storageBucket: 'agroressource-44db2.appspot.com',
    measurementId: 'G-M0NBB98KZ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzHg9jE05F5Kp0BgMbcLyBd3f56bp2LJo',
    appId: '1:1006346901910:android:43d17e0e752a33765fe5b7',
    messagingSenderId: '1006346901910',
    projectId: 'agroressource-44db2',
    storageBucket: 'agroressource-44db2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZI5oYysH710bMaOAAr-hvH8yc3992NYg',
    appId: '1:1006346901910:ios:b9f60feb2ee6568d5fe5b7',
    messagingSenderId: '1006346901910',
    projectId: 'agroressource-44db2',
    storageBucket: 'agroressource-44db2.appspot.com',
    androidClientId: '1006346901910-h580pttf6vmv2ee119ba4o6g983rj9rp.apps.googleusercontent.com',
    iosClientId: '1006346901910-gd3kg979rje1bhfhkvos9run66qr59n8.apps.googleusercontent.com',
    iosBundleId: 'com.tiastgroup.agroressources',
  );
}
