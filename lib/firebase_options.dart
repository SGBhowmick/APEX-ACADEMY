// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDA3r1h8bJ8UYzCMTPMukanTkdbZv_Y_kI',
    appId: '1:788824510229:web:3e9fd05697d90d4819e31c',
    messagingSenderId: '788824510229',
    projectId: 'finalproject-3a23c',
    authDomain: 'finalproject-3a23c.firebaseapp.com',
    databaseURL: 'https://finalproject-3a23c-default-rtdb.firebaseio.com',
    storageBucket: 'finalproject-3a23c.appspot.com',
    measurementId: 'G-E4ZS61GK48',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBatSTglrflOcj3e_ahfyCEvqAyXA-xI0A',
    appId: '1:788824510229:android:a5e78486ce52153219e31c',
    messagingSenderId: '788824510229',
    projectId: 'finalproject-3a23c',
    databaseURL: 'https://finalproject-3a23c-default-rtdb.firebaseio.com',
    storageBucket: 'finalproject-3a23c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIZmWVNFrN9b-HiM6-NneM8tkTq0PitE4',
    appId: '1:788824510229:ios:01960ce48343dc0219e31c',
    messagingSenderId: '788824510229',
    projectId: 'finalproject-3a23c',
    databaseURL: 'https://finalproject-3a23c-default-rtdb.firebaseio.com',
    storageBucket: 'finalproject-3a23c.appspot.com',
    iosBundleId: 'com.example.projectfinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIZmWVNFrN9b-HiM6-NneM8tkTq0PitE4',
    appId: '1:788824510229:ios:01960ce48343dc0219e31c',
    messagingSenderId: '788824510229',
    projectId: 'finalproject-3a23c',
    databaseURL: 'https://finalproject-3a23c-default-rtdb.firebaseio.com',
    storageBucket: 'finalproject-3a23c.appspot.com',
    iosBundleId: 'com.example.projectfinal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDA3r1h8bJ8UYzCMTPMukanTkdbZv_Y_kI',
    appId: '1:788824510229:web:70ae79a37034ffc319e31c',
    messagingSenderId: '788824510229',
    projectId: 'finalproject-3a23c',
    authDomain: 'finalproject-3a23c.firebaseapp.com',
    databaseURL: 'https://finalproject-3a23c-default-rtdb.firebaseio.com',
    storageBucket: 'finalproject-3a23c.appspot.com',
    measurementId: 'G-R32X94LPYZ',
  );

}